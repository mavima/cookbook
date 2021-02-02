class UsersController < ApplicationController
  def show
    # authorize current_user
  end

  private

  def user_params
    params.require(:user).permit(:Firstname, :Lastname, :email, :avatar, :admin)
  end
end
