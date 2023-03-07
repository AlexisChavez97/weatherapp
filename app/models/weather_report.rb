# frozen_string_literal: true

class WeatherReport < ApplicationRecord
  belongs_to :user

  validates_presence_of :iata_code, :city_name, :condition, :time, :temperature, :latitude, :longitude, :icon

  scope :recent, -> { order(created_at: :desc).limit(5) }
end
