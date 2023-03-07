# frozen_string_literal: true]

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true

  has_many :weather_reports, dependent: :destroy
end