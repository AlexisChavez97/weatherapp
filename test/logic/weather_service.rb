# frozen_string_literal: true

require "test_helper"
require "logic/weather_service.rb"

class Logic::WeatherServiceTest < ActiveSupport::TestCase
  def setup
    stub_weather_service
  end

  test "should return city name" do
    subject = Logic::WeatherService.new("LAX")
    assert_equal "Los Angeles", subject.name
  end

  test "should return condition" do
    subject = Logic::WeatherService.new("LAX")
    assert_equal "Partly cloudy", subject.condition
  end

  test "should return time" do
    subject = Logic::WeatherService.new("LAX")
    assert_equal "day", subject.time
  end

  test "should return temperature" do
    subject = Logic::WeatherService.new("LAX")
    assert_equal 12, subject.temperature
  end

  test "should return longitude" do
    subject = Logic::WeatherService.new("LAX")
    assert_equal -118.24, subject.longitude
  end

  test "should return latitude" do
    subject = Logic::WeatherService.new("LAX")
    assert_equal 34.05, subject.latitude
  end

  test "should return icon" do
    subject = Logic::WeatherService.new("LAX")
    assert_equal "//cdn.weatherService.com/weather/64x64/day/113.png", subject.icon
  end
end