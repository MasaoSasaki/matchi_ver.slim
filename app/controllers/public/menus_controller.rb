class Public::MenusController < Public::Base
  def index
    @menus = Menu.all
    @restaurants = Restaurant.all
  end

  def show
  end
end
