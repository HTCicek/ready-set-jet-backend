class Flight < ApplicationRecord
  belongs_to :user
  has_one :arrival
  has_one :departure
end
