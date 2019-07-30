module Cars
  class TransactionsController < Vehicles::TransactionsController

    def create
      @transaction = Transaction.create!(vehicle_id: @vehicle.id, price: @pricing.total_cost, discounted: @pricing.discounts.any?)
    end

    private

    def load_vehicle
      @vehicle = Vehicle.get_car(params[:license_plate])
      @vehicle.save! unless @vehicle.persisted?
    end
  end
end
