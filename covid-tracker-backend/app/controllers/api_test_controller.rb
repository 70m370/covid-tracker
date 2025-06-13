class ApiTestController < ApplicationController
  def covid
    # expects params: state, type, start_date, end_date
    data = CovidApiService.fetch(
      state: params[:state],
      # type: params[:type],
      date: params[:start_date],
      city: params[:city]
      # end_date: params[:end_date]
    )

    render json: data
  rescue => e
    render json: { error: e.message }, status: :bad_request
  end
end
