class FavouritesController < ApplicationController
    def create
    @recipe = Recipe.find(params[:recipe_id])
    @favourite = Favourite.create(
      user: current_user,
      recipe: @recipe
    )
    redirect_to :back(fallback_location: root_path)
    # authorize @favourite
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @user = current_user
    @favourite.destroy
    redirect_back(fallback_location: root_path)
    # authorize @favourite
  end
end
