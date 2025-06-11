Rails.application.routes.draw do
  resources :countries_benchmarks
  root "hello_world#show"

  # /api_test/covid?country=Argentina example with the query on it 
  get "api_test/covid", to: "api_test#covid"

  # encapsulate inside a namespace ? idk
  resources :countries_benchmarks
end
