require "test_helper"

class CountriesBenchmarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @countries_benchmark = countries_benchmarks(:one)
  end

  test "should get index" do
    get countries_benchmarks_url, as: :json
    assert_response :success
  end

  test "should create countries_benchmark" do
    assert_difference("CountriesBenchmark.count") do
      post countries_benchmarks_url, params: { countries_benchmark: { country_2: @countries_benchmark.country_2, coutrny_1: @countries_benchmark.coutrny_1, end_date: @countries_benchmark.end_date, name: @countries_benchmark.name, start_date: @countries_benchmark.start_date } }, as: :json
    end

    assert_response :created
  end

  test "should show countries_benchmark" do
    get countries_benchmark_url(@countries_benchmark), as: :json
    assert_response :success
  end

  test "should update countries_benchmark" do
    patch countries_benchmark_url(@countries_benchmark), params: { countries_benchmark: { country_2: @countries_benchmark.country_2, coutrny_1: @countries_benchmark.coutrny_1, end_date: @countries_benchmark.end_date, name: @countries_benchmark.name, start_date: @countries_benchmark.start_date } }, as: :json
    assert_response :success
  end

  test "should destroy countries_benchmark" do
    assert_difference("CountriesBenchmark.count", -1) do
      delete countries_benchmark_url(@countries_benchmark), as: :json
    end

    assert_response :no_content
  end
end
