Rails.application.routes.draw do

  devise_for :admins
  get 'admin/dashboard' , to: 'admin#dashboard'
  # Getting Dashboard of Admin
  get 'admin_addrestaurant', to: 'admin#AddRestaurant'
  get 'admin_addrestaurantdata', to: 'admin#AddRestaurantData'
  # Getting Admin Add Restaurant
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
