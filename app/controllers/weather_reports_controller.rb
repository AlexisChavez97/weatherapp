# frozen_string_literal: true

class WeatherReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @weather_reports = current_user.weather_reports.recent
  end

  def new
    @weather_report = WeatherReport.new
  end

  def create
    result = ::CreateWeatherReport.call(
      params: weather_report_params,
      user: current_user
    )
    if result.success?
      redirect_to weather_report_path(result.weather_report)
    else
      render :new
    end
  end

  def show
    @weather_report = WeatherReport.find(params[:id])
  end

  private

  def weather_report_params
    params.require(:weather_report).permit(:iata_code)
  end
end