class User < ApplicationRecord
  has_many :flights
  has_many :arrivals, through: :flights
  has_many :departures, through: :flights

  def user_obj
    {
      'flights': self.flights
    }
  end
end
