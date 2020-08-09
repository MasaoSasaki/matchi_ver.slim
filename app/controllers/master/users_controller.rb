class Master::UsersController < Master::Base
  def index
    @users = User.all
  end

  def show
  end
end
