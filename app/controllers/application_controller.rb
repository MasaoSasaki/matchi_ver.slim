class ApplicationController < ActionController::Base

  before_action :configure_user_permitted_parameters, if: :devise_controller?

  def current_user?
    user_id = params[:user_id]
    id = params[:id]
    unless user_id == current_public_user.id.to_s || id == current_public_user.id.to_s
      id = "#{params[:user_id]}" + "#{params[:id]}"
      redirect_to redirect_path(user_id: id)  #redirect先に入力されたIDを渡す
    end
  end

  def current_restaurant?
    restaurant_id = params[:restaurant_id]
    id = params[:id]
    unless restaurant_id == current_owner_restaurant.id.to_s || id == current_owner_restaurant.id.to_s
      id = "#{params[:restaurant_id]}" + "#{params[:id]}"
      redirect_to redirect_path(restaurant_id: id)  #redirect先に入力されたIDを渡す
    end
  end

  protected
  def configure_user_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_family, :name_first, :name_family_kana, :name_first_kana, :phone_number])
  end

  # def configure_restaurant_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name_family, :name_first, :name_family_kana, :name_first_kana, :phone_number])
  # end

end
