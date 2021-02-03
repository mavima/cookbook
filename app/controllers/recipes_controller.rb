class RecipesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @recipes = Recipe.search_by_name_and_description(params[:query])
    else
      @recipes = Recipe.all
    end
  end

  def show
    @categories = @recipe.categories
  end

  def new
    @recipe = Recipe.new
    4.times { @recipe.doses.build }
    4.times { @recipe.steps.build }
  end

  def create
    @recipe = Recipe.new(recipe_strong_params)
    @recipe.user_id = User.find(current_user.id).id
    @categories = Category.where(category_ids: @recipe.category_ids)
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
    params.require(:recipe).permit(:name, :description, :time, :portions, :rating, :photo, :user_id, :dose, category_ids: [],steps_attributes: [:id, :detail, :recipe_id, :_destroy] , doses_attributes: [:id, :amount, :ingredient, :unit, :recipe_id, :_destroy])
  end

end
