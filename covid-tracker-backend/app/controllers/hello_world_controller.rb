class HelloWorldController < ApplicationController
  def show
    render json: "Hello world from covid tracker backend"
  end
end
