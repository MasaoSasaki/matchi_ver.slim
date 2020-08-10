class Owner::MenusController < Owner::Base
  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
  end

  def new
  end
end
