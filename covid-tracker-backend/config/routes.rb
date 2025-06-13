Rails.application.routes.draw do
  root "hello_world#show"

  #
  # example
  # http://127.0.0.1:3000/api_test/covid?state=RJ&date=2020-05-29&city=Rio+de+Janeiro
  get "/api/covid/", to: "api_brasil#covid"

  # encapsulate inside a namespace ? idk
end
