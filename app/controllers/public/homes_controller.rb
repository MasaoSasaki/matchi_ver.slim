class Public::HomesController < Public::Base
  def top
    @menus = Menu.all
    @restaurants = Restaurant.all
    @location = 100
  end

  def about
  end
end
