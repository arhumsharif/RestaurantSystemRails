class DiscountController < ApplicationController
    def AddDiscount
        @discounts = Discount.all
    end
    def AddDiscountData
        # Finding Restaurant against Manager
        @data = Employee.find(current_employee.id)
        @manager_id = @data.manager_id
        @dataone = Restaurant.find_by(manager_id:@manager_id)
        @restaurant = @dataone.restaurant_name
        # Major Functionality to add Option
        if params[:item].present? and params[:discount].present?
                @item_find = Item.find_by(item_name: params[:item])
                @discount_find = Discount.find_by(item_id: @item_find.id)
                if @discount_find
                    redirect_to employee_adddiscount_path
                    flash[:alert] = 'Item has been already discounted'
                else
                    @addon_entry = Discount.create(item_id: @item_find.id,Discount: params[:discount])
                    redirect_to employee_adddiscount_path
                    flash[:notice] = 'Item been discounted successfully'
                end
        else
          redirect_to employee_addaddon_path
          flash[:alert] = 'Please Fill all the details'
        end
    end

    def DestroyDiscount
        @discount_id = params[:id]
        Discount.destroy(@discount_id)
        redirect_to employee_adddiscount_path
        flash[:alert] = 'Discount has been deleted successfully'
    end

    def UpdateDiscountData
        # Major Functionality to add Option
        if params[:item].present? and params[:discount].present?
            @item_find = Item.find_by(item_name: params[:item])
            @discount_find = Discount.find_by(item_id: @item_find.id)
            if @discount_find
                @discount_find.Discount = params[:discount]
                @discount_find.save
                redirect_to employee_adddiscount_path
                flash[:notice] = 'Item discounts updated successfully'
            else
                redirect_to employee_adddiscount_path
                flash[:alert] = 'Item was not discounted previously'
            end
        else
        redirect_to employee_adddiscount_path
        flash[:alert] = 'Please Fill all the details'
        end
    end
end
