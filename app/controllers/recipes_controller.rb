class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :send_recipe]


  def index
    @recipes = policy_scope(Recipe)
    if params[:query].present? && params[:category].blank? 
      @recipes = @recipes.search_by_name_and_description(params[:query]) 
    elsif params[:query].present? && params[:category][:id].blank?
      @recipes = @recipes.search_by_name_and_description(params[:query]) 
    elsif params[:category].present? && params[:query].blank?
      my_cat = Category.find_by_id(params[:category][:id].to_i)
      @recipes = @recipes.select { |recipe| recipe.categories.include?(my_cat) }
    elsif params[:category].present? && params[:query].present?
      @recipes = @recipes.search_by_name_and_description(params[:query]) 
      my_cat = Category.find_by_id(params[:category][:id].to_i)
      @recipes = @recipes.select { |recipe| recipe.categories.include?(my_cat) }
    else
      @recipes = @recipes.order(:name)
    end
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
    @recipe = Recipe.new(recipe_strong_params)
    @recipe.user_id = User.find(current_or_guest_user.id).id
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
    RecipeMailer.send_recipe(current_user, @recipe).deliver_now
    redirect_to recipe_path(@recipe)
    authorize @recipe
  end

  private

  def set_recipe
    @recipe = Recipe.friendly.find(params[:id])
    authorize @recipe
  end

  def recipe_strong_params
    params.require(:recipe).permit(:name, :description, :time, :portions, :rating, :photo, :photo_cache, :language, :user_id, :dose, category_ids: [],steps_attributes: [:id, :detail, :recipe_id, :_destroy] , doses_attributes: [:id, :amount, :ingredient, :unit, :recipe_id, :_destroy])
  end

end
