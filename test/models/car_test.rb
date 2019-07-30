require 'test_helper'

class CarTest < ActiveSupport::TestCase
  test 'create valid car' do
    car = Car.new(license_plate: '12345')
    assert car.valid?
    assert_difference 'Car.count', +1 do
      car.save!
    end
  end

  test 'car is a type of vehicle' do
    cars(:one).is_a?(Vehicle)
  end

  test 'require license plate' do
    car = Car.new(license_plate: nil)
    refute car.valid?
    assert car.errors.added?(:license_plate, :blank)
  end

  test 'reject duplicate license plate' do
    car = cars(:one).dup
    refute car.valid?
    assert car.errors.messages[:license_plate].any?(/taken/)
  end
end
