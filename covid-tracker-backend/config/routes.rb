Rails.application.routes.draw do
  root "hello_world#show"

  # /api_test/covid?country=Argentina example with the query on it 
  get "api_test/covid", to: "api_test#covid"
end
