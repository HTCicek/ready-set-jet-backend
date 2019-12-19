class User < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :arrivals, through: :flights
  has_many :departures, through: :flights

  has_secure_password

  def user_obj
    {
      'user': {
        id: self.id,
        'flights': self.flights,
        username: self.username,
        email: self.email
      }
    }
  end
end
