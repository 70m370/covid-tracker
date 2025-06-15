class CovidApiService
  include HTTParty

  
  base_uri "https://api.brasil.io/v1/dataset/covid19/caso/data/"

  def self.fetch(state:, date:, city:, place_type:)
    response = get("", query: {
      state: state,
      date: date,
      city: city,
      place_type: place_type
    }, headers: {
      "Authorization" => "Token  #{ENV['BRASIL_IO_API']}"
    })

    raise StandardError, "code: #{response.code}  body:  #{response}" unless response.success?

    response.parsed_response
  end
end
