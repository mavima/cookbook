class FavouritesController < ApplicationController
    def create
      # @favourite = current_user.favourites.new(favourite_params)
      # if !@favourite.save
      #   flash[:notice] = @favourite.full_messages.to_sentence
      # end
      # redirect_to @favourite.recipe, success: "Recipe added to your favourites"

    @recipe = Recipe.find(params[:recipe_id])
    @favourite = Favourite.create(
      user: current_user,
      recipe: @recipe
    )
    if @favourite.create(user, recipe)
      render status: :ok
    else
      render :new
    end
    # authorize @favourite
  end

  def destroy
    @favourite = current_user.favourites.find(params[:id])
    @recipe = Recipe.find(params[:id])
    # @user = current_user
    @favourite.destroy
    redirect_to recipe_path(@recipe)
    # authorize @favourite
  end

  private

  # def favourite_params
  #   params.require(:favourite).permit(:recipe_id)
  # end


end
