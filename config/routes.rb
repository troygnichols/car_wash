Rails.application.routes.draw do

  get 'prices/cars/:license_plate', to: 'prices#cars'
  get 'prices/trucks/:license_plate', to: 'prices#trucks'
end
