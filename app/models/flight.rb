class Flight < ApplicationRecord
  belongs_to :user
  belongs_to :destination, class_name: 'Location'
  belongs_to :origin, class_name: 'Location'

  def flight_obj
    {
      id: self.id,
      user: self.user,
      flight_time: self.flight_time,
      departure_time: self.departure_time,
      arrival_time: self.arrival_time,
      origin: self.origin.location_obj,
      destination: self.destination.location_obj
    }
  end
end

