Rails.application.routes.draw do
  root "hello_world#show"

  #
  # example
  # http://127.0.0.1:3000/api_test/covid?country=Brazil&date=2020-09-08&type=cases
  # types can be, deaths or cases
  get "api_test/covid", to: "api_test#covid"

  # encapsulate inside a namespace ? idk
end
