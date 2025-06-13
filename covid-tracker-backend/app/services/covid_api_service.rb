class CovidApiService
  include HTTParty

  
  base_uri "https://api.brasil.io/v1/dataset/covid19/caso/data/"

  def self.fetch(state:, date:, city:)
    response = get("", query: {
      state: state,
      date: date,
      city: city
    }, headers: {
      "Authorization" => "Token  #{ENV['BRASIL_IO_API']}"
    })

    raise StandardError, "code: #{response.code}  body:  #{response}" unless response.success?

    response.parsed_response
  end
end
