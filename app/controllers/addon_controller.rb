class AddonController < ApplicationController
    def AddAddon
        @addons = Addon.all
    end
    def AddAddonData
        # Finding Restaurant against Manager
        @data = Employee.find(current_employee.id)
        @manager_id = @data.manager_id
        @dataone = Restaurant.find_by(manager_id:@manager_id)
        @restaurant = @dataone.restaurant_name
        # Major Functionality to add Option
        if params[:addon].present? and params[:price].present?
                @addon_find = Addon.find_by(addon_name: params[:addon])
                if @addon_find
                    redirect_to employee_addaddon_path
                    flash[:alert] = 'Item Addon has been already added'
                else
                    @addon_entry = Addon.create(addon_name: params[:addon],price: params[:price])
                    redirect_to employee_addaddon_path
                    flash[:notice] = 'Item Addon has been added successfully'
                end
        else
          redirect_to employee_addaddon_path
          flash[:alert] = 'Please Fill all the details'
        end
    end
    def DestroyAddon
        @addon_id = params[:id]
        Addon.destroy(@addon_id)
        redirect_to employee_addaddon_path
        flash[:alert] = 'Addon has been deleted successfully'
    end

    # ----------------------------------------------------------
    # Assign Option
    def AssignAddon
        @itemaddon = ItemAddon.all
    end

    def AssignAddonData
        if params[:item].present? and params[:addon].present?
            @addon_find = Addon.find_by(addon_name: params[:addon])
            @item_find = Item.find_by(item_name: params[:item])
            if @addon_find and @item_find
                @addon_entry = ItemAddon.create(item_id: @item_find.id,addon_id: @addon_find.id)
                redirect_to employee_assignaddon_path
                flash[:notice] = 'Item Addon has been assigned successfully'
            else
                redirect_to employee_assignaddon_path
                flash[:alert] = 'No Item or Item Addon with this name'
            end
        else
        redirect_to employee_assignaddon_path
        flash[:alert] = 'Please Fill all the details'
        end
    end
    def DestroyItemAddon
        @addon_id = params[:id]
        ItemAddon.destroy(@addon_id)
        redirect_to employee_assignaddon_path
        flash[:alert] = 'Item Addon has been deleted successfully'
    end
end
