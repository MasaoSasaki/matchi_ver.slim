class Owner::Base < ApplicationController

  # 管理者がログイン中は登録店舗全て閲覧可能
  before_action :authenticate_owner_restaurant!, unless: :master_admin_signed_in?

  # 閲覧しようとするページがログイン店舗のID（パラメータ）かどうか？
  def current_restaurant?
    restaurant_id = params[:restaurant_id]
    id = params[:id]

    unless master_admin_signed_in?
      unless restaurant_id == current_owner_restaurant.id.to_s || id == current_owner_restaurant.id.to_s
        id = "#{params[:restaurant_id]}" + "#{params[:id]}"
        redirect_to redirect_path(restaurant_id: id)  #redirect先に入力されたIDを渡す
      end
    end
  end

end