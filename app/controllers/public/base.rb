class Public::Base < ApplicationController
  before_action :authenticate_public_user!, except: [:top, :about, :contact, :privacy, :terms, :admin]
end
