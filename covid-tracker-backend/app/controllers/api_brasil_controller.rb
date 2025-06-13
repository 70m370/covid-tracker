class ApiBrasilController < ApplicationController
  
  def covid
    data = CovidApiService.fetch(
      state: params[:state],
      date: params[:date],
      city: params[:city]
    )

    render json: data
  rescue => e
    render json: { error: e.message }, status: :bad_request
  end
end
