class ApiTestController < ApplicationController
  

  def covid
    # type can be cases or deaths
    data = CovidApiService.fetch(params[:country], params[:type], params[:date])
    render json: data
  rescue => e
    render json: { error: e.message }, status: :bad_request # 400
  end
  
end
