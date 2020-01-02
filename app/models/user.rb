class User < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :arrivals, through: :flights
  has_many :departures, through: :flights

  has_secure_password

  def user_obj
    {
      id: self.id,
      'flights': self.flights.map(&:flight_obj),
      username: self.username,
      email: self.email,
      bed_time: self.bed_time,
      wake_up_time: self.wake_up_time
    }
  end
end
