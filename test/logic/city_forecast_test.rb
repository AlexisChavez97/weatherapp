# frozen_string_literal: true

require "test_helper"
require "logic/city_forecast"

class Logic::CityForecastTest < ActiveSupport::TestCase
  def setup
    stub_weather_api
  end

  test "should return city name" do
    city_forecast = Logic::CityForecast.new("LAX")
    assert_equal "Los Angeles", city_forecast.name
  end

  test "should return condition" do
    city_forecast = Logic::CityForecast.new("LAX")
    assert_equal "Partly cloudy", city_forecast.condition
  end

  test "should return time" do
    city_forecast = Logic::CityForecast.new("LAX")
    assert_equal "day", city_forecast.time
  end

  test "should return temperature" do
    city_forecast = Logic::CityForecast.new("LAX")
    assert_equal 12, city_forecast.temperature
  end

  test "should return longitude" do
    city_forecast = Logic::CityForecast.new("LAX")
    assert_equal -118.24, city_forecast.longitude
  end

  test "should return latitude" do
    city_forecast = Logic::CityForecast.new("LAX")
    assert_equal 34.05, city_forecast.latitude
  end

  test "should return icon" do
    city_forecast = Logic::CityForecast.new("LAX")
    assert_equal "//cdn.weatherapi.com/weather/64x64/day/113.png", city_forecast.icon
  end
end