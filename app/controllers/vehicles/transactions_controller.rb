module Vehicles
  class TransactionsController < ApplicationController
    before_action :load_vehicle, :load_pricing, :check_stolen!

    def load_pricing
      @pricing = Pricing.new(@vehicle)
    end

    def check_stolen!
      raise 'Stolen vehicle' if @vehicle.stolen?
    end
  end
end
