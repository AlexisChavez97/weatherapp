# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require 'webmock/minitest'
WebMock.disable_net_connect!(allow_localhost: true)

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def stub_weather_api
    stub_request(:get, "http://api.weatherapi.com/v1/current.json?key=#{ENV["WEATHER_API_KEY"]}&q=LAX").
      to_return(status: 200, body: File.read(Rails.root.join("test", "fixtures", "files", "weather_api_response.json")), headers: {})
  end
end
