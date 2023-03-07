# frozen_string_literal: true

require 'test_helper'

class WeatherReportsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:valid)
    @weather_report = weather_reports(:valid)
    stub_weather_api
    sign_in @user
  end

  test "should get index" do
    get weather_reports_path
    assert_response :success
  end

  test "should get new" do
    get new_weather_report_path
    assert_response :success
  end

  test "should create weather report" do
    assert_difference('WeatherReport.count') do
      post weather_reports_path, params: { weather_report: { iata_code: @weather_report.iata_code } }
    end

    assert_redirected_to weather_report_path(WeatherReport.last)
  end

  test "should show weather report" do
    get weather_report_path(@weather_report)
    assert_response :success
  end
end
