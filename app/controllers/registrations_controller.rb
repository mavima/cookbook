class RegistrationsController < Devise::RegistrationsController


  private


  def sign_up_params
    params.require(:user).permit(:Firstname, :Lastname, :email, :password, :password_confirmation, :admin, :avatar)
  end
end
