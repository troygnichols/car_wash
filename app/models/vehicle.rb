class Vehicle < ApplicationRecord

  validates :license_plate, presence: true, uniqueness: true

  class << self

    def get_car(license_plate)
      get_vehicle(license_plate, Car)
    end

    def get_truck(license_plate)
      get_vehicle(license_plate, Truck)
    end

    def get_vehicle(license_plate, type)
      if found = find_by(license_plate: license_plate)
        raise ArgumentError, "License plate #{license_plate} is a #{found.type} not a #{type}" unless found.is_a?(type)
        return found
      end

      type.new(license_plate: license_plate)
    end
  end
end
