# frozen_string_literal: true

class WeatherReport < ApplicationRecord
  belongs_to :user

  validates_presence_of :iata_code, :city_name, :condition, :time, :temperature, :latitude, :longitude, :icon
  validates :iata_code, length: { is: 3 }

  scope :recent, -> { order(created_at: :desc).limit(5) }

  def temperature_to_degrees
    "#{temperature}°"
  end
end
