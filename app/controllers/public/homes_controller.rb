class Public::HomesController < Public::Base
  def top
    @menus = Menu.all
  end

  def about
  end
end
