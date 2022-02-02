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
    authorize @favourite
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @user = current_user
    @recipe = @favourite.recipe
    @favourite.destroy
    redirect_to recipe_path(@recipe)
    authorize @favourite
  end


end
