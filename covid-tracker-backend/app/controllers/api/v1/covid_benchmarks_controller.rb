class Api::V1::CovidBenchmarksController < ApplicationController
  before_action :set_covid_benchmark, only: %i[ show update destroy ]

  # GET /covid_benchmarks
  def index
    @covid_benchmarks = CovidBenchmark.all

    render json: @covid_benchmarks
  end

  # GET /covid_benchmarks/1
  def show
    render json: @covid_benchmark
  end

  # POST /covid_benchmarks
  def create
    @covid_benchmark = CovidBenchmark.new(covid_benchmark_params)

    if @covid_benchmark.save
      render json: @covid_benchmark, status: :created, location: @covid_benchmark
    else
      render json: @covid_benchmark.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /covid_benchmarks/1
  def update
    if @covid_benchmark.update(covid_benchmark_params)
      render json: @covid_benchmark
    else
      render json: @covid_benchmark.errors, status: :unprocessable_entity
    end
  end

  # DELETE /covid_benchmarks/1
  def destroy
    @covid_benchmark.destroy!
  end

  private

    # benchmark calculation

    # aftercreate result ? 


    # Use callbacks to share common setup or constraints between actions.
    def set_covid_benchmark
      @covid_benchmark = CovidBenchmark.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def covid_benchmark_params
      params.expect(covid_benchmark: [ :name, :first_state, :second_state, :first_city, :second_city, :date_start, :date_end ])
    end
end
