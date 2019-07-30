class PricesController < ApplicationController

  # These actions don't follow the normal REST-ful conventions, but they
  # make sense for the API routes we want to offer

  def cars
    car = Vehicle.get_car(params[:license_plate])
    @pricing = Pricing.new(car)
  end

  def trucks
    truck = Vehicle.get_truck(params[:license_plate])
    @pricing = Pricing.new(truck)
  end

  private

  def car_params
    params.require(:license_plate)
  end
end
