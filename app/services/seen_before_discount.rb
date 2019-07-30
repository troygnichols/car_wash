class SeenBeforeDiscount

  attr_reader :pricing

  def initialize(pricing)
    @pricing = pricing
  end

  def valid?
    prev_transaction = pricing.vehicle.transactions.last
    return false unless prev_transaction

    # XXX this should really check that it was actually THIS kind of discount
    # prev_transaction.discounts.include?('SeenBeforeDiscount')

    !prev_transaction.discounted?
  end

  def cost
    pricing.cost_before_discounts * 0.5
  end

  def message
    '50% off on your second time through'
  end
end
