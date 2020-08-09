class ApplicationController < ActionController::Base

  private
  def after_sign_in_path_for(resource)
    master_path(resource)
  end

  def after_sign_out_path_for(resource)
    new_master_admin_session_path
  end

end
