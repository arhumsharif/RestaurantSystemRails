Rails.application.routes.draw do

  devise_for :admins
  get 'admin/dashboard' , to: 'admin#dashboard'
  # Getting Dashboard of Admin
  get 'admin_addrestaurant', to: 'admin#AddRestaurant'
  get 'admin_addrestaurantdata', to: 'admin#AddRestaurantData'
  # Getting Admin Add Restaurant
  get 'admin_addcutpercentage', to: 'admin#AddCutpercentage'
  get 'admin_addcutpercentagedata', to: 'admin#AddCutpercentageData'
  # Viewing Admin Restaurants
  get 'admin_view', to: 'admin#View'
  # Delete a Restaurant 
  delete '/admindeleterestaurant/:id' , to: 'admin#destroy_restaurant', as: 'deleterestaurant'
  # Delete a Restaurant Cut Percentage
  delete '/admindeleterestaurantcut/:id' , to: 'admin#destroy_restaurant_cut', as: 'deleterestaurantcut'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
