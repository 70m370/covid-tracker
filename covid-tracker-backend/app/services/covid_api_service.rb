class CovidApiService
  include HTTParty
  base_uri "https://api.api-ninjas.com/v1"

  # fetch data from the api
  def self.fetch(country, type, start_date, end_date)
    response = get("/covid19",
  query: {
    country: country,
    type: type
  },
  headers: {
    "X-Api-Key" => ENV["API_KEY"]
  })

    date = start_date
    # gambiarra
    if end_date == nil
      end_date = date
    end

    if response.success?

      data = response.parsed_response
      puts data.inspect

      country_data = data.first

      # adapt this to a .map and extract the total and new cases on this range

      timeline_data = country_data[type.downcase] || {}
      specific_data = timeline_data[date]
      
      unless specific_data
        raise StandardError, "No data found for type '#{type}' on date '#{date}'"
      end
      {
        total: specific_data["total"].to_s,
        new: specific_data["new"].to_s,
        start_date: date,
        end_date: end_date
      }
    else
      raise StandardError, "Failed to fetch Covid data"
    end
  end
end
