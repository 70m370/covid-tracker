class CovidApiService
  include HTTParty

  
  base_uri "https://api.brasil.io/v1/dataset/covid19/caso/data/"

  def self.fetch(state:, start_date:, city:)# , type:, start_date:, end_date:)
    response = get("", query: {
      state: state,
      date: start_date,
      city: city
      # date__lte: end_date,
      # page_size: 1000
    }, headers: {
      "Authorization" => "Token  #{ENV['BRASIL_IO_API']}"
    })

    raise StandardError, "code : #{response.code}  body:  #{response}" unless response.success?

    response.parsed_response

    # date = start_date
    # # gambiarra
    # if end_date == nil
    #   end_date = date
    # end

    # if response.success?

    #   data = response.parsed_response
    #   puts data.inspect

    #   country_data = data.first

    #   # adapt this to a .map and extract the total and new cases on this range

    #   timeline_data = country_data[type.downcase] || {}
    #   specific_data = timeline_data[date]
      
    #   unless specific_data
    #     raise StandardError, "No data found for type '#{type}' on date '#{date}'"
    #   end
    #   {
    #     total: specific_data["total"].to_s,
    #     new: specific_data["new"].to_s,
    #     start_date: date,
    #     end_date: end_date
    #   }
    # else
    #   raise StandardError, "Failed to fetch Covid data"
    # end
  end
end
