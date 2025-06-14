class CovidBenchmark < ApplicationRecord
    # benchmark calculation
    
    # this comparrison can be deaths - confirmed cases - death rate or confirmed per 100k 
    def benchmark_comparison(comparison)
      begin
        start_first = CovidApiService.fetch(state: self.first_state, date: self.date_start, city: self.first_city)
        end_first = CovidApiService.fetch(state: self.first_state, date: self.date_end, city: self.first_city)

        first_result = calculate_variation(start_first["results"][0], end_first["results"][0])

        start_second = CovidApiService.fetch(state: self.second_state, city: self.second_city, date: self.date_start)
        end_second = CovidApiService.fetch(state: self.second_state, city: self.second_city, date: self.date_end)
        
        # needs to put [ results ] to gather the json response correctly so != nil
        second_result = calculate_variation(start_second["results"][0], end_second["results"][0])

        # switch case for comparison
        worst_city = case comparison
        when "deaths"
                      second_result[:deaths_diff] > first_result[:deaths_diff] ? second_result[:city] : first_result[:city]
        when "confirmed"
                      second_result[:confirmed_diff] > first_result[:confirmed_diff] ? second_result[:city] : first_result[:city]
        when "death_rate"
                      second_result[:death_rate_diff] > first_result[:death_rate_diff] ? second_result[:city] : first_result[:city]
        when "confirmed_per_100k"
                      second_result[:confirmed_per_100k_diff] > first_result[:confirmed_per_100k_diff] ? second_result[:city] : first_result[:city]
        end

        # puts "City with worse #{comparison}: #{worst_city}"
        # Optionally return all results for usage
        {
          first: first_result,
          second: second_result,
          worse_city: worst_city,
          comparison_metric: comparison
        }

      # result will be the worse city - do a create here
        
      # self.results.create!(city: first_result[:city], state: first_result[:state], data: first_result)
      rescue => e
        Rails.logger.error("API fetch failed: #{e.message}")
        { error: "API fetch failed: #{e.message}" }
      end
    end
  
  def calculate_variation(start_data, end_data)
    # instant return nil case
    return nil unless start_data && end_data
    {
      city: end_data["city"],
      state: end_data["state"],
      date_start: start_data["date"],
      date_end: end_data["date"],
      confirmed_start: start_data["confirmed"],
      confirmed_end: end_data["confirmed"],
      confirmed_diff: end_data["confirmed"] - start_data["confirmed"],

      deaths_start: start_data["deaths"],
      deaths_end: end_data["deaths"],
      deaths_diff: end_data["deaths"] - start_data["deaths"],

      death_rate_start: start_data["death_rate"],
      death_rate_end: end_data["death_rate"],
      death_rate_diff: (end_data["death_rate"] - start_data["death_rate"]).round(4),

      confirmed_per_100k_start: start_data["confirmed_per_100k_inhabitants"],
      confirmed_per_100k_end: end_data["confirmed_per_100k_inhabitants"],
      confirmed_per_100k_diff: (end_data["confirmed_per_100k_inhabitants"] - start_data["confirmed_per_100k_inhabitants"]).round(2)
    }
  end
end
