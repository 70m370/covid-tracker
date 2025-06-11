class CovidApiService
  include HTTParty
  base_uri "https://api.api-ninjas.com/v1"

  def self.fetch(country, type, date)
    response = get("/covid19",
  query: {
    country: country,
    type: type
  },
  headers: {
    "X-Api-Key" => ENV["API_KEY"]
  })

    if response.success?

      data = response.parsed_response
      puts data.inspect

      country_data = data.first

      timeline_data = country_data[type.downcase] || {}

      specific_data = timeline_data[date]

      unless specific_data
        raise StandardError, "No data found for type '#{type}' on date '#{date}'"
      end
      {
        total: specific_data["total"].to_s,
        new: specific_data["new"].to_s,
        date: date
      }
    else
      raise StandardError, "Failed to fetch Covid data"
    end
  end
end
