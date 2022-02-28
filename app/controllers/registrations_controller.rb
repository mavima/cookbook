class RegistrationsController < Devise::RegistrationsController


  def create
    super do |resource|
      UserMailer.welcome(current_user).deliver_now
    end
  end

  private


  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin, :avatar)
  end
end
