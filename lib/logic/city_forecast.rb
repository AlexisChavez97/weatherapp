# frozen_string_literal: true

require "net/http"

module Logic
  class CityForecast
    attr_reader :city
    
    def initialize(city)
      @city = city
    end

    def name
      current_forecast["location"]["region"]
    end

    def condition
      current_forecast["current"]["condition"]["text"]
    end

    def time
      current_forecast["current"]["is_day"] == 1 ? "day" : "night"
    end

    def temperature
      current_forecast["current"]["temp_c"]
    end

    def latitude
      current_forecast["location"]["lat"]
    end

    def longitude
      current_forecast["location"]["lon"]
    end

    def icon
      current_forecast["current"]["condition"]["icon"]
    end

    private

    def current_forecast
      @current_forecast ||= fetch_current_forecast
    end

    def fetch_current_forecast
      uri = URI("http://api.weatherapi.com/v1/current.json?key=#{ENV["WEATHER_API_KEY"]}&q=#{city}")
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end
  end
end
