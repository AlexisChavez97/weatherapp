# frozen_string_literal: true

require "logic/weather_service.rb"

class CreateWeatherReport
  include Interactor

  def call
    context.fail!(message: weather_service.errors) if weather_service.bad_request?
    
    weather_report = WeatherReport.new(weather_service.attributes)
    weather_report.user = context.user
    if weather_report.save
      context.weather_report = weather_report
    else
      context.fail!(message: weather_report.errors.full_messages)
    end
  end

  private

  def weather_service
    @weather_service ||= ::Logic::WeatherService.new(context.params[:iata_code])
  end
end
