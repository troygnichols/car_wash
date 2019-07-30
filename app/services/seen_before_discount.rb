class SeenBeforeDiscount

  attr_reader :pricing

  def initialize(pricing)
    @pricing = pricing
  end

  def valid?
    # TODO
    true
  end

  def cost
    pricing.cost_before_discounts * 0.5
  end

  def message
    '50% off on your second time through'
  end
end
