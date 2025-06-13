require "test_helper"

class CovidBenchmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @covid_benchmark = covid_benchmarks(:one)
  end

  test "should get index" do
    get covid_benchmarks_url, as: :json
    assert_response :success
  end

  test "should create covid_benchmark" do
    assert_difference("CovidBenchmark.count") do
      post covid_benchmarks_url, params: { covid_benchmark: { date_end: @covid_benchmark.date_end, date_start: @covid_benchmark.date_start, first_city: @covid_benchmark.first_city, first_state: @covid_benchmark.first_state, name: @covid_benchmark.name, second_city: @covid_benchmark.second_city, second_state: @covid_benchmark.second_state } }, as: :json
    end

    assert_response :created
  end

  test "should show covid_benchmark" do
    get covid_benchmark_url(@covid_benchmark), as: :json
    assert_response :success
  end

  test "should update covid_benchmark" do
    patch covid_benchmark_url(@covid_benchmark), params: { covid_benchmark: { date_end: @covid_benchmark.date_end, date_start: @covid_benchmark.date_start, first_city: @covid_benchmark.first_city, first_state: @covid_benchmark.first_state, name: @covid_benchmark.name, second_city: @covid_benchmark.second_city, second_state: @covid_benchmark.second_state } }, as: :json
    assert_response :success
  end

  test "should destroy covid_benchmark" do
    assert_difference("CovidBenchmark.count", -1) do
      delete covid_benchmark_url(@covid_benchmark), as: :json
    end

    assert_response :no_content
  end
end
