class FavouritesController < ApplicationController
    def create
    @recipe = Recipe.find(params[:recipe_id])
    @favourite = Favourite.create(
      user: current_user,
      recipe: @recipe
    )
    redirect_to recipe_path(@recipe)
    # authorize @favourite
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @user = current_user
    @favourite.destroy
    redirect_back(fallback_location: root_path)
    # authorize @favourite
  end

  # def find_recipe!
  #   @recipe = Recipe.id!(params[:recipe_id])
  # end

  # private

  # def create
  #   current_user.favourite(@recipe)
  #   render 'recipes/show'
  # end

  # def destroy
  #   current_user.unfavourite(@recipe)
  #   render 'recipes/show'
  # end

end
