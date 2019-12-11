class Location < ApplicationRecord
  has_many :flight_departures, foreign_key: 'origin', class_name: 'Flight'
  has_many :flight_arrivals, foreign_key: 'destination', class_name: 'Flight'
end
