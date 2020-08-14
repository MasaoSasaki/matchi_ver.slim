class Public::MenusController < Public::Base
  def index
    @menus = Menu.all
    @restaurants = Restaurant.all
  end

  def show
    @menu = Menu.find(params[:id])
    restaurant_id = Menu.find(params[:id]).restaurant_id
    @restaurant = Restaurant.find(restaurant_id)
  end
end
