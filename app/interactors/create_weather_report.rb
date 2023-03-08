# frozen_string_literal: true

require "logic/weather_service.rb"

class CreateWeatherReport
  include Interactor

  def call
    weather_report = WeatherReport.new(
      iata_code: context.params[:iata_code],
      city_name: weather_report_details.name,
      condition: weather_report_details.condition,
      time: weather_report_details.time,
      temperature: weather_report_details.temperature,
      latitude: weather_report_details.latitude,
      longitude: weather_report_details.longitude,
      icon: weather_report_details.icon
    )
    weather_report.user = context.user
    if weather_report.save
      context.weather_report = weather_report
    else
      context.fail!(message: weather_report.errors.full_messages)
    end
  end

  private

  def weather_report_details
    @weather_report_details ||= ::Logic::WeatherService.new(context.params[:iata_code])
  end

  def check_city_exists
    weather_report_details.bad_request?
  end
end
