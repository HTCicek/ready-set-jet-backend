class Location < ApplicationRecord
  has_many :flight_departures, foreign_key: 'origin', class_name: 'Flight'
  has_many :flight_arrivals, foreign_key: 'destination', class_name: 'Flight'
  
  def location_obj
    {
      id: self.id,
      name: self.name,
      city: self.city,
      country: self.country,
      iata: self.iata,
      latitude: self.latitude,
      longitude: self.longitude,
      timezone: self.timezone,
      dst: self.dst,
      tz_olson: self.tz_olson
    }
  end
end
