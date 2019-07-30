json.total_cost @pricing.total_cost
json.cost_before_discounts @pricing.cost_before_discounts
json.details do
  json.base_cost do
    json.value @pricing.base_vehicle.cost
    json.message @pricing.base_vehicle.message
  end
  json.before_discounts do
    json.value @pricing.cost_before_discounts
    json.message 'includes any special fees for this vehicle'
  end
  json.fees @pricing.fees do |fee|
    json.cost fee.cost
    json.message fee.message
  end
  json.discounts @pricing.discounts do |discount|
    json.cost discount.cost
    json.message discount.message
  end
end
