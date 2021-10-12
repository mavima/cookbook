class FavouritesController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favourite = Favourite.create(
      user: current_user,
      recipe: @recipe
      )
    if @favourite.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end


    # @recipe = Recipe.find(params[:recipe_id])
    # @favourite = Favourite.create(params[favourite_params])
    #   if @favourite.save
    #     flash[:success] = 'The recipe was added in your favourites'
    #     redirect_to(@recipe)
    #   else
    #     raise
    #   end
    # redirect_to recipe_path(@recipe)
    # # authorize @favourite
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @user = current_user
    @recipe = @favourite.recipe
    @favourite.destroy
    redirect_to recipe_path(@recipe)
    # authorize @favourite
  end

  private

  # def favourite_params
  #   params.require(:favourite).permit(:recipe_id)
  # end


end
