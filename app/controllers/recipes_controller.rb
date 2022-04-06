class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]


  def index
    @recipes = policy_scope(Recipe)
    if params[:query].present?
      @recipes = policy_scope(Recipe).search_by_name_and_description(params[:query]) 
    elsif params[:category].present?
      my_cat = Category.find_by_id(params[:category][:id].to_i)
      @recipes = @recipes.select { |recipe| recipe.categories.include?(my_cat) }
      # @recipes = policy_scope(Recipe).search_by_category(params[:category]) 
      # @recipes = Recipe.joins(:categories).where("categories.id ILIKE ?", "%#{params[:category]}")
      # @recipes = Recipe.where("?=ANY(recipe_categories)", params[:query])
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
    
    # @recipe.user = current_or_guest_user
    @recipe = Recipe.new(recipe_strong_params)
    @recipe.user_id = User.find(current_or_guest_user.id).id
    # set_categories
    @categories = Category.where(category_ids: @recipe.category_ids)
    if I18n.locale == :fi
      @recipe.language = "finnish"
    else
      @recipe.language = "english"
    end
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
    authorize @recipe
  end

  def edit
    # set_categories
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
    params.require(:recipe).permit(:name, :description, :time, :portions, :rating, :photo, :photo_cache, :language, :user_id, :dose, category_ids: [],steps_attributes: [:id, :detail, :recipe_id, :_destroy] , doses_attributes: [:id, :amount, :ingredient, :unit, :recipe_id, :_destroy])
  end

  def set_categories
    @recipe_categories = RecipeCategory.where(category_id: @recipe.category_id)
    @categories = @recipe_categories.map do |fc|
      rc = Category.find(rc.category_id)
    end
  end


end
