class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  after_action :transfer_guest_to_user, only: :create, if: :devise_controller?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def configure_permitted_parameters
    attributes = [:first_name, :last_name, :email, :avatar, :admin]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  # transfer recipe from guest to new user
  def transfer_guest_to_user
    # UserMailer.welcome(current_user).deliver_now
    my_recipies = Recipe.all.where(:user_id => guest_user.id)
    if my_recipies
      my_recipies.each do |recipe|
        recipe.update!(user_id: current_user.id)
      end
    end
  end
end
