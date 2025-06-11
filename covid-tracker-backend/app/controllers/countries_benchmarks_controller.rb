class CountriesBenchmarksController < ApplicationController
  before_action :set_countries_benchmark, only: %i[ show update destroy ]

  # GET /countries_benchmarks
  def index
    @countries_benchmarks = CountriesBenchmark.all

    render json: @countries_benchmarks
  end

  # GET /countries_benchmarks/1
  def show
    render json: @countries_benchmark
  end

  # POST /countries_benchmarks
  def create
    @countries_benchmark = CountriesBenchmark.new(countries_benchmark_params)

    if @countries_benchmark.save
      render json: @countries_benchmark, status: :created, location: @countries_benchmark
    else
      render json: @countries_benchmark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /countries_benchmarks/1
  def update
    if @countries_benchmark.update(countries_benchmark_params)
      render json: @countries_benchmark
    else
      render json: @countries_benchmark.errors, status: :unprocessable_entity
    end
  end

  # DELETE /countries_benchmarks/1
  def destroy
    @countries_benchmark.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_countries_benchmark
      @countries_benchmark = CountriesBenchmark.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def countries_benchmark_params
      params.expect(countries_benchmark: [ :name, :coutrny_1, :country_2, :start_date, :end_date ])
    end
end
