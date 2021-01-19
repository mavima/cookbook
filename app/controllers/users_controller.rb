class UsersController < ApplicationController
  def show
    authorize current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo, :admin)
  end
end
