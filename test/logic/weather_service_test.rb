# frozen_string_literal: true

require "test_helper"
require "logic/weather_service.rb"

class Logic::WeatherServiceTest < ActiveSupport::TestCase
  def setup
    stub_weather_service
  end

  test "should return attributes" do
    subject = Logic::WeatherService.new("LAX")
    expected = { iata_code: "LAX", city_name: "Los Angeles", condition: "Partly cloudy", time: "day",
      temperature: 12.0, latitude: 34.05, longitude: -118.24, icon: "//cdn.weatherapi.com/weather/64x64/day/113.png"}
    assert_equal expected, subject.attributes
  end
end