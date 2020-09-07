class Public::Base < ApplicationController

  before_action :authenticate_public_user!, except: [:top, :about, :contact, :privacy, :terms, :admin, :redirect]

  # 閲覧しようとするページがログインユーザーのID（パラメータ）かどうか？
  def current_user?
    user_id = params[:user_id]
    id = params[:id]
    unless user_id == current_public_user.id.to_s || id == current_public_user.id.to_s
      id = "#{params[:user_id]}" + "#{params[:id]}"
      redirect_to redirect_path(user_id: id)  #redirect先に入力されたIDを渡す
    end
  end

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
