class Flight < ApplicationRecord
  belongs_to :user
  has_one :destination, class_name: 'Arrival'
  has_one :origin, class_name: 'Departure'
end
