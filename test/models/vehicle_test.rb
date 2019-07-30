require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  test 'cars and trucks cannot have same license plate' do
    truck = trucks(:simple)
    car   = cars(:one)
    lic   = '1234'

    truck.update(license_plate: lic)
    car.license_plate = lic

    refute car.valid?
    assert car.errors.messages[:license_plate].any?(/taken/)
  end
end
