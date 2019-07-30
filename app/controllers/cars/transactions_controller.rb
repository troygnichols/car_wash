module Cars
  class TransactionsController < ApplicationController
    before_action :load_vehicle, :load_pricing, :check_stolen!

    def create
      @transaction = Transaction.create!(vehicle_id: @vehicle.id, price: @pricing.total_cost, discounted: @pricing.discounts.any?)
    end

    private

    def load_vehicle
      @vehicle = Vehicle.get_car(params[:license_plate])
      @vehicle.save! unless @vehicle.persisted?
    end

    def load_pricing
      @pricing = Pricing.new(@vehicle)
    end

    def transaction_params
      params.require(:license_plate)
    end

    def check_stolen!
      raise RuntimeError 'Stolen vehicle' if @vehicle.stolen?
    end
  end
end
