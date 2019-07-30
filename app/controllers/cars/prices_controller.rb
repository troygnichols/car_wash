module Cars
  class PricesController < ApplicationController

    def show
      car = Vehicle.get_car(params[:license_plate])
      @pricing = Pricing.new(car)
    end
  end
end
