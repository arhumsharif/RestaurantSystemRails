class AdminController < ApplicationController
  before_action :authenticate_admin!
  def dashboard
  end
  def AddRestaurant

  end
  def AddRestaurantData
    if params[:restaurant].present?
      @restaurant_find = Restaurant.find_by(restaurant_name: params[:restaurant])
      if @restaurant_find
        redirect_to admin_addrestaurant_path
        flash[:alert] = 'This Restaurant is already in Database'
      else
        @managerID = Restaurant.last.manager_id
        @managerID = @managerID + 1
        @id = Restaurant.last.id
        @id = @id + 1
        @restaurant_entry = Restaurant.create(id: @id ,restaurant_name: params[:restaurant], manager_id: @managerID, admin_id: current_admin.id,status: params[:status], open_time: params[:open_time], close_time: params[:close_time])
        @manager_entry = Employee.create(email: params[:manager_email], encrypted_password: params[:manager_password],password: params[:manager_password] , manager_id: @managerID)
        redirect_to admin_addrestaurant_path
        flash[:notice] = 'Restaurant has been added successfully'
      end
    else
      flash.now[:alert] = 'Please Enter a Restaurant Name'
      render 'admin/AddRestaurant'
    end
  end
  def AddCutpercentage

  end
  def AddCutpercentageData
    if params[:restaurant].present?
      if params[:percentage].present? and params[:percentage].to_i < 100
        @restaurant_find = Restaurant.find_by(restaurant_name: params[:restaurant])
        if @restaurant_find
          @restaurant_percent_find = RestaurantPercent.find_by(restaurant_name: params[:restaurant])
          if @restaurant_percent_find
            @restaurant_percent_find.percent = params[:percentage]
            @restaurant_percent_find.save
            redirect_to admin_addcutpercentage_path
            flash[:notice] = 'Restaurant Cut Percentage has been updated successfully'
          else
            @id = RestaurantPercent.last.id
            @id = @id + 1
            @restaurant_entry = RestaurantPercent.create(id: @id ,restaurant_name: params[:restaurant], percent: params[:percentage], admin_id: current_admin.id)
            redirect_to admin_addcutpercentage_path
            flash[:notice] = 'Restaurant Cut Percentage has been added successfully'
          end
        else
          redirect_to admin_addcutpercentage_path
          flash[:alert] = 'This Restaurant is not in your Records'
        end
      else
        flash.now[:alert] = 'Please Enter a Valid Percentage'
        render 'admin/AddCutpercentage'
      end
    else
      flash.now[:alert] = 'Please Enter a Restaurant Name'
      render 'admin/AddCutpercentage'
    end
  end

  def View 
    @restaurants = Restaurant.all
    @restaurantsPercent = RestaurantPercent.all
  end

  # Delete a Restaurant 
  def destroy_restaurant
    @res_id = params[:id]
    Restaurant.destroy(@res_id)
    redirect_to admin_view_path
    flash[:alert] = 'Restaurant has been deleted successfully'
  end

  # Delete a Restaurant Cut Percentage
  def destroy_restaurant_cut
    @res_id = params[:id]
    RestaurantPercent.destroy(@res_id)
    redirect_to admin_view_path
    flash[:alert] = 'Restaurant Cut Percentage has been deleted successfully'
  end
end
