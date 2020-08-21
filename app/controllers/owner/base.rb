class Owner::Base < ApplicationController
  before_action :authenticate_owner_restaurant!, unless: :master_admin_signed_in?
end