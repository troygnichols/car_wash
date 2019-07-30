module Trucks
  class TransactionsController < Vehicles::TransactionsController
    before_action :load_vehicle, :load_pricing, :check_stolen!

    def create
      @transaction = Transaction.create!(vehicle_id: @vehicle.id, price: @pricing.total_cost, discounted: @pricing.discounts.any?)
    end

    private

    def load_vehicle
      @vehicle = Vehicle.get_truck(params[:license_plate])
      @vehicle.save! unless @vehicle.persisted?
    end
  end
end
