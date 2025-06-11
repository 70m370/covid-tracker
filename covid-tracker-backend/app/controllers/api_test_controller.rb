class ApiTestController < ApplicationController
  
  def covid
    data = CovidApiService.fetch(params[:country] || "Brazil")
    render json: data
  rescue => e
    render json: { error: e.message }, status: :bad_request
  end
  
end
