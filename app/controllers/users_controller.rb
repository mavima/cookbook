class UsersController < ApplicationController
  def show
    # authorize current_user
  end

  def favourited?(recipe)
    self.favourites.find_by(recipe_id: recipe.id).present?
  end

  def get_fav_instances(recipe)
    self.favourites.find_by(recipe_id: recipe.id)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :admin)
  end
end
