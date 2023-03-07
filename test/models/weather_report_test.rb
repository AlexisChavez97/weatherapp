# frozen_string_literal: true

require 'test_helper'

class WeatherReportTest < ActiveSupport::TestCase

  def setup
    @subject = WeatherReport.new
    @subject.user = users(:valid)
  end
  
  test "should save weather report" do
    @subject.iata_code = "LAX"
    @subject.city_name = "Los Angeles"
    @subject.condition = "Sunny"
    @subject.time = "2020-01-01 12:00:00"
    @subject.temperature = 70
    @subject.latitude = 34.0522
    @subject.longitude = -118.2437
    @subject.icon = "01d"
    assert @subject.save
  end
  
  test "should not save weather report without iata_code" do
    assert_not @subject.save
  end

  test "should not save weather report without city_name" do
    @subject.iata_code = "LAX"
    assert_not @subject.save
  end

  test "should not save weather report without condition" do
    @subject.iata_code = "LAX"
    @subject.city_name = "Los Angeles"
    assert_not @subject.save
  end

  test "should not save weather report without time" do
    @subject.iata_code = "LAX"
    @subject.city_name = "Los Angeles"
    @subject.condition = "Sunny"
    assert_not @subject.save
  end

  test "should not save weather report without temperature" do
    @subject.iata_code = "LAX"
    @subject.city_name = "Los Angeles"
    @subject.condition = "Sunny"
    @subject.time = "2020-01-01 12:00:00"
    assert_not @subject.save
  end

  test "should not save weather report without latitude" do
    @subject.iata_code = "LAX"
    @subject.city_name = "Los Angeles"
    @subject.condition = "Sunny"
    @subject.time = "2020-01-01 12:00:00"
    @subject.temperature = 70
    assert_not @subject.save
  end

  test "should not save weather report without longitude" do
    @subject.iata_code = "LAX"
    @subject.city_name = "Los Angeles"
    @subject.condition = "Sunny"
    @subject.time = "2020-01-01 12:00:00"
    @subject.temperature = 70
    @subject.latitude = 34.0522
    assert_not @subject.save
  end

  test "should not save weather report without icon" do
    @subject.iata_code = "LAX"
    @subject.city_name = "Los Angeles"
  end
end