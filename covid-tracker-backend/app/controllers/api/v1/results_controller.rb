class Api::V1::ResultsController < ApplicationController
  def show 
    @results = Result.all

    render json: @results
  end
end
