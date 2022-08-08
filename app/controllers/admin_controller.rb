class AdminController < ApplicationController
  before_action :authenticate_admin!
  def dashboard
  end
  def AddRestaurant

  end
end
