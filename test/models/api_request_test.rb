# frozen_string_literal: true

require "test_helper"

class ApiRequestTest < ActiveSupport::TestCase
  test "should not save api_request without url" do
    api_request = ApiRequest.new
    assert_not api_request.save
  end

  test "should save api_request with url" do
    api_request = ApiRequest.new(url: "key=secret&q=iata:sfo")
    assert api_request.save
  end

  test "should not save api_request with same url" do
    api_request = ApiRequest.new(url: "key=secret&q=iata:sfo")
    api_request.save
    api_request = ApiRequest.new(url: "key=secret&q=iata:sfo")
    assert_not api_request.save
  end

  test "should save api_request with different url" do
    api_request = ApiRequest.new(url: "key=secret&q=iata:sfo")
    api_request.save
    api_request = ApiRequest.new(url: "key=secret&q=iata:tij")
    assert api_request.save
  end
end