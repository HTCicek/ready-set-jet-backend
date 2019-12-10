class Location < ApplicationRecord
  has_many :arrivals
  has_many :departures
end
