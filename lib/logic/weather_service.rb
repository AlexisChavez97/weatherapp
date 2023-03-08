# frozen_string_literal: true

require "net/http"

module Logic
  class WeatherService
    attr_reader :city
    
    def initialize(city)
      @city = city
    end

    def name
      current_weather["location"]["name"]
    end

    def condition
      current_weather["current"]["condition"]["text"]
    end

    def time
      current_weather["current"]["is_day"] == 1 ? "day" : "night"
    end

    def temperature
      current_weather["current"]["temp_c"]
    end

    def latitude
      current_weather["location"]["lat"]
    end

    def longitude
      current_weather["location"]["lon"]
    end

    def icon
      current_weather["current"]["condition"]["icon"]
    end

    def unsuccesful_request?
      current_weather["error"]
    end

    def current_weather
      @current_weather ||= fetch_current_weather
    end

    private

    def fetch_current_weather
      uri = URI("http://api.weatherapi.com/v1/current.json?key=#{ENV["WEATHER_API_KEY"]}&q=iata:#{city}")
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end
  end
end
