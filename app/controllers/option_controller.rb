class OptionController < ApplicationController
    def AddOption
        @options = Option.all
    end
    def AddOptionData
        # Finding Restaurant against Manager
        @data = Employee.find(current_employee.id)
        @manager_id = @data.manager_id
        @dataone = Restaurant.find_by(manager_id:@manager_id)
        @restaurant = @dataone.restaurant_name
        # Major Functionality to add Option
        if params[:option].present? and params[:price].present?
                @option_find = Option.find_by(option_name: params[:option])
                if @option_find
                    redirect_to employee_addoption_path
                    flash[:alert] = 'Item Option has been already added'
                else
                    @option_entry = Option.create(option_name: params[:option],price: params[:price])
                    redirect_to employee_addoption_path
                    flash[:notice] = 'Item Option has been added successfully'
                end
        else
          redirect_to employee_addoption_path
          flash[:alert] = 'Please Fill all the details'
        end
    end
    def DestroyOption
        @option_id = params[:id]
        Option.destroy(@option_id)
        redirect_to employee_addoption_path
        flash[:alert] = 'Option has been deleted successfully'
    end

    # ----------------------------------------------------------
    # Assign Option
    def AssignOption
        @itemoptions = ItemOption.all
    end

    def AssignOptionData
        if params[:item].present? and params[:option].present?
            @option_find = Option.find_by(option_name: params[:option])
            @item_find = Item.find_by(item_name: params[:item])
            if @option_find and @item_find
                @option_entry = ItemOption.create(item_id: @item_find.id,option_id: @option_find.id)
                redirect_to employee_assignoption_path
                flash[:notice] = 'Item Option has been assigned successfully'
            else
                redirect_to employee_assignoption_path
                flash[:alert] = 'No Item or Item Option with this name'
            end
        else
        redirect_to employee_assignoption_path
        flash[:alert] = 'Please Fill all the details'
        end
    end
    def DestroyItemOption
        @option_id = params[:id]
        ItemOption.destroy(@option_id)
        redirect_to employee_assignoption_path
        flash[:alert] = 'Item Option has been deleted successfully'
    end
end
