class RecipesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_strong_params)
    @recipe.user_id = User.find(current_user.id).id
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_strong_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_strong_params
    params.require(:recipe).permit(:name, :instruction, :description, :photo, :user_id)

  end



end
