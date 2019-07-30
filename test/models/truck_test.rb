require 'test_helper'

class TruckTest < ActiveSupport::TestCase
  test 'create valid truck' do
    truck = Truck.new(license_plate: '12345')
    assert truck.valid?
    assert_difference 'Truck.count', +1 do
      truck.save!
    end
  end

  test 'truck is a type of vehicle' do
    trucks(:simple).is_a?(Vehicle)
  end

  test 'require license plate' do
    truck = Truck.new(license_plate: nil)
    refute truck.valid?
    assert truck.errors.added?(:license_plate, :blank)
  end

  test 'reject duplicate license plate' do
    truck = trucks(:simple).dup
    refute truck.valid?
    assert truck.errors.messages[:license_plate].any?(/taken/)
  end
end
