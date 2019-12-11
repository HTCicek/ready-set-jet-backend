class Flight < ApplicationRecord
  belongs_to :user
  has_one :destination, class_name: 'Location'
  has_one :origin, class_name: 'Location'
end

