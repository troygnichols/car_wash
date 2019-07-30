class Pricing

  Price = Struct.new(:cost, :message)
  Fee   = Struct.new(:attr, :cost, :message)

  VEHICLE_PRICES = {
    'Car'   => Price.new(5.00,  'for cars'),
    'Truck' => Price.new(10.00, 'for trucks')
  }

  FEES = [
    Fee.new(:bed_muddy, 2.00, 'extra for trucks with muddy bed')
  ]

  DISCOUNTS = [
    SeenBeforeDiscount
  ]

  attr_reader :vehicle

  def initialize(vehicle)
    @vehicle = vehicle
  end

  def total_cost
    cost_before_discounts - discounts.sum(&:cost)
  end

  def cost_before_discounts
    base_vehicle.cost + fees.sum(&:cost)
  end

  def base_vehicle
    VEHICLE_PRICES[vehicle.type]
  end

  def discounts
    DISCOUNTS.reduce([]) { |memo, discount_type|
      discount = discount_type.new(self)
      discount.valid? ? memo << discount : memo
    }
  end

  def fees
    FEES.select { |fee| vehicle.send(fee.attr) }
  end
end
