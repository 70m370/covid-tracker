class CovidApiService
  include HTTParty
  base_uri "https://api.api-ninjas.com/v1"

  def self.fetch(country)
    response = get("/covid19", query: { country: country }, headers: { "X-Api-Key" => ENV["API_KEY"]
  })

    # response sanity check
    if response.success?
      data = response.parsed_response

      # debuggin
      # puts data.inspect  

      country_data = data.first
      cases_by_date = country_data["cases"]

      latest_date = cases_by_date.keys.max # gather more stuff from here
      latest_data = cases_by_date[latest_date]

      # way cleaner omfg
      {
        confirmed_cases: latest_data["total"].to_s, # need type convertion
        new_cases: latest_data["new"].to_s,
        date: latest_date
      }
    else
      raise StandardError, "Failed to fetch Covid data"
    end
  end
end
