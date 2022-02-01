class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]


  def index
    @recipes = policy_scope(Recipe)
    if params[:query].present?
      @recipes = policy_scope(Recipe).search_by_name_and_description(params[:query])
    else
      @recipes = policy_scope(Recipe).order(:name)
    end
  end

  def search
    if params[:query].present?
    @recipes = Recipe.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @recipes = Recipe.all
    end
    authorize @recipes
  end


  def show
    @categories = @recipe.categories
  end

  def new
    @recipe = Recipe.new
    4.times { @recipe.doses.build }
    4.times { @recipe.steps.build }
    authorize @recipe
  end


  def create
    current_user = current_or_guest_user
    @recipe = Recipe.new(recipe_strong_params)
    @recipe.user_id = User.find(current_user.id).id
    @categories = Category.where(category_ids: @recipe.category_ids)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
    authorize @recipe
  end

  def edit
  end

  def update
    if @recipe.update(recipe_strong_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
    authorize @recipe
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
    authorize @recipe
  end

  def send_recipe
    @recipe = Recipe.find(params[:id])
    RecipeMailer.send_recipe(current_user, @recipe).deliver_now
    redirect_to recipe_path(@recipe)
    authorize @recipe
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def recipe_strong_params
    params.require(:recipe).permit(:name, :description, :time, :portions, :rating, :photo, :photo_cache, :user_id, :dose, category_ids: [],steps_attributes: [:id, :detail, :recipe_id, :_destroy] , doses_attributes: [:id, :amount, :ingredient, :unit, :recipe_id, :_destroy])
  end

end
