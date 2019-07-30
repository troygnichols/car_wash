Rails.application.routes.draw do

  namespace :cars do
    get 'prices/:license_plate', controller: :prices, action: :show
    # post 'transactions/:license_plate'
  end

  namespace :trucks do
    get 'prices/:license_plate', controller: :prices, action: :show
    # post 'transactions/:license_plate'
  end
end
