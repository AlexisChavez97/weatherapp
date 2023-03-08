# frozen_string_literal: true

require "net/http"

module Logic
  class WeatherService
    BASE_URL = "http://api.weatherapi.com/v1/current.json"
    CACHE_POLICY = lambda { 1.hour.ago }
    
    attr_reader :city
    
    def initialize(city)
      @city = city
    end

    def attributes
      { 
        iata_code: city,
        city_name: name,
        condition: condition,
        time: time,
        temperature: temperature,
        latitude: latitude,
        longitude: longitude,
        icon: icon
      }
    end

    def errors
      response["error"]&.[]("message")
    end

    def bad_request?
      errors.present?
    end

    private

    def name
      response["location"]["name"]
    end

    def condition
      response["current"]["condition"]["text"]
    end

    def time
      response["current"]["is_day"] == 1 ? "day" : "night"
    end

    def temperature
      response["current"]["temp_c"]
    end

    def latitude
      response["location"]["lat"]
    end

    def longitude
      response["location"]["lon"]
    end

    def icon
      response["current"]["condition"]["icon"]
    end

    def response
      @response ||= fetch_current_weather
    end

    def fetch_current_weather
      ApiRequest.cache(city_search_url.query, CACHE_POLICY) do
        weather_service_request
      end
    end

    def weather_service_request
      uri = city_search_url
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    def city_search_url
      URI("#{BASE_URL}?key=#{ENV["WEATHER_API_KEY"]}&q=iata:#{city}")
    end
  end
end
