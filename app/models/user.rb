class User < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :arrivals, through: :flights
  has_many :departures, through: :flights

  has_secure_password

  def user_obj
    {
      'flights': self.flights
    }
  end
end
