class CategoryController < ApplicationController
    def AddCategory
        # @categories = Category.joins(:item).all
        @categories = Category.all
        # @categories.each do |category|
        #     # @find_item = Item.find_by(id: category.item_id)
        #     # @categories[index].item_name = @find_item
        #     @category.attributes.merge(display_name: "test display name")
        # end
    end

    def AddCategoryData
        # Finding Restaurant against Manager
        @data = Employee.find(current_employee.id)
        @manager_id = @data.manager_id
        @dataone = Restaurant.find_by(manager_id:@manager_id)
        @restaurant = @dataone.restaurant_name
        # Major Functionality to add Item
        if params[:item].present? and params[:category].present? 
            @item_find = Item.find_by(item_name: params[:item])
            if @item_find
                @category_entry = Category.create(item_id: @item_find.id, category_name: params[:category], restaurant_name: @restaurant)
                redirect_to employee_addcategory_path
                flash[:notice] = 'Category has been added successfully'
            else
                redirect_to employee_addcategory_path
                flash[:alert] = 'Item not Available'
            end
        else
          redirect_to employee_addcategory_path
          flash[:alert] = 'Please Fill all the details'
        end
    end
    def DestroyCategory
        @category_id = params[:id]
        Category.destroy(@category_id)
        redirect_to employee_addcategory_path
        flash[:alert] = 'Category has been deleted successfully'
      end
end
