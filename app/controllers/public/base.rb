class Public::Base < ApplicationController

  before_action :authenticate_public_user!, except: %i[top about contact privacy terms admin redirect]

  # 入力された店舗IDが存在するかどうか？
  def exist_public_restaurant?
    unless Restaurant.find_by(id: params[:id])
      redirect_to root_path
    end
  end

  # 入力されたメニューIDが存在するかどうか？
  def exist_public_menu?
    unless Menu.find_by(id: params[:id])
      redirect_to public_menus_path
    end
  end

end
