class EmployeeController < ApplicationController
  before_action :authenticate_employee!
    def dashboard
      # Finding Restaurant against Manager
      @data = Employee.find(current_employee.id)
      @manager_id = @data.manager_id
      @dataone = Restaurant.find_by(manager_id:@manager_id)
      @restaurant = @dataone.restaurant_name
    end
    def AddItem
      @items = Item.all
    end

    def AddItemData
        # Finding Restaurant against Manager
        @data = Employee.find(current_employee.id)
        @manager_id = @data.manager_id
        @dataone = Restaurant.find_by(manager_id:@manager_id)
        @restaurant = @dataone.restaurant_name
        # Major Functionality to add Item
        if params[:item].present? and params[:item_desc].present? and params[:item_price].present? 
          @item_find = Item.find_by(item_name: params[:item])
          if @item_find
            redirect_to employee_additem_path
            flash[:alert] = 'This Item is already Stored'
          else
            @item_entry = Item.create(item_name: params[:item], item_desc: params[:item_desc], price: params[:item_price], restaurant_name: @restaurant)
            redirect_to employee_additem_path
            flash[:notice] = 'Item has been added successfully'
          end
        else
          redirect_to employee_additem_path
          flash[:alert] = 'Please Fill all the details'
        end
    end

    def DestroyItem
      @item_id = params[:id]
      Item.destroy(@item_id)
      redirect_to employee_additem_path
      flash[:alert] = 'Item has been deleted successfully'
    end

    def UpdateItemData
      # Finding Restaurant against Manager
      @data = Employee.find(current_employee.id)
      @manager_id = @data.manager_id
      @dataone = Restaurant.find_by(manager_id:@manager_id)
      @restaurant = @dataone.restaurant_name
      # Major Functionality to Update Item
      if params[:item].present? and params[:item_desc].present? and params[:item_price].present? 
        @item_find = Item.find_by(item_name: params[:item])
        if @item_find
          @item_find.item_desc = params[:item_desc]
          @item_find.price = params[:item_price]
          @item_find.save
          redirect_to employee_additem_path
          flash[:notice] = 'Item has been updated successfully'
        else
          redirect_to employee_additem_path
          flash[:alert] = 'This Item is not in your Records'
        end
      else
        redirect_to employee_additem_path
        flash[:alert] = 'Please Fill all the details'
      end
    end
end
