Rails.application.routes.draw do

  devise_for :admins
  get 'admin/dashboard' , to: 'admin#dashboard'
  get 'admin/addrestaurant', to: 'admin#AddRestaurant'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
