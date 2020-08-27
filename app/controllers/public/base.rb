class Public::Base < ApplicationController
  before_action :authenticate_public_user!, except: [:top, :about, :contact, :privacy, :terms, :admin, :redirect]
  before_action :current_user?, except: [:top, :about, :admin, :contact, :privacy, :terms, :redirect]
end
