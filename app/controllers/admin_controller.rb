class AdminController < ApplicationController
  before_action :authenticate_admin!
  def dashboard
  end
  def AddRestaurant

  end
  def AddRestaurantData
    if params[:restaurant].present?
      if params[:manager].present?
        @restaurant_find = Restaurant.find_by(restaurant_name: params[:restaurant])
        if @restaurant_find
          redirect_to admin_addrestaurant_path
          flash[:alert] = 'This Restaurant is already in Database'
        else
          @id = Restaurant.last.id
          @id = @id + 1
          @restaurant_entry = Restaurant.create(id: @id ,restaurant_name: params[:restaurant], manager_id: params[:manager], admin_id: current_admin.id)
          redirect_to admin_addrestaurant_path
          flash[:notice] = 'Restaurant has been added successfully'
        end
      else
        flash.now[:alert] = 'Please Enter a Manager ID'
        render 'admin/AddRestaurant'
      end
    else
      flash.now[:alert] = 'Please Enter a Restaurant Name'
      render 'admin/AddRestaurant'
    end
  end
end
