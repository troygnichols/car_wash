module Trucks
  class PricesController < ApplicationController

    def show
      car = Vehicle.get_truck(params[:license_plate])
      @pricing = Pricing.new(car)
    end
  end
end
