Rails.application.routes.draw do

  devise_for :employees
  devise_for :admins
  get 'admin_dashboard' , to: 'admin#dashboard'
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
  # Employee --------- Module
  # Getting Dashboard
  get 'employee_dashboard' , to: 'employee#dashboard'
  # Getting Add Item Form
  get 'employee_additem', to: 'employee#AddItem'
  # Filling Item Form
  get 'employee_additemdata', to: 'employee#AddItemData'
  # Deleting an Item
  delete '/deleteitem/:id' , to: 'employee#DestroyItem', as: 'deleteitem'
  # Update an Item
  get 'employee_updateitemdata', to: 'employee#UpdateItemData'
  # Getting Add Category Form
  get 'employee_addcategory', to: 'category#AddCategory'
  # Getting Add Category Form Filled
  get 'employee_addcategorydata', to: 'category#AddCategoryData'
  # Deleting an Item From Category
  delete '/deletecategory/:id' , to: 'category#DestroyCategory', as: 'deletecategory'
  # Routes for Options

  # Getting Add Option Form
  get 'employee_addoption', to: 'option#AddOption'
  # Getting Option data Filled
  get 'employee_addoptiondata', to: 'option#AddOptionData'
  # Delete an Option
  delete '/deleteoption/:id' , to: 'option#DestroyOption', as: 'deleteoption'
  # -----------assign options
  # Assign page
  get 'employee_assignoption', to: 'option#AssignOption'
  # Assign Data to table
  get 'employee_assignoptiondata', to: 'option#AssignOptionData'
  # Delete an Item Option
  delete '/deleteitemoption/:id' , to: 'option#DestroyItemOption', as: 'deleteitemoption'
  # Routes for addons

  # Getting Add Addon Form
  get 'employee_addaddon', to: 'addon#AddAddon'
  # Getting Addon data Filled
  get 'employee_addaddondata', to: 'addon#AddAddonData'
  # Delete an Addon
  delete '/deleteaddon/:id' , to: 'addon#DestroyAddon', as: 'deleteaddon'
  # -----------assign addons
  # Assign page
  get 'employee_assignaddon', to: 'addon#AssignAddon'
  # Assign Data to table
  get 'employee_assignaddondata', to: 'addon#AssignAddonData'
  # Delete an Item Addon
  delete '/deleteitemaddon/:id' , to: 'addon#DestroyItemAddon', as: 'deleteitemaddon'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
