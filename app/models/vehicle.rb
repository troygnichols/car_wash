class Vehicle < ApplicationRecord

  validates :license_plate, presence: true, uniqueness: true
end
