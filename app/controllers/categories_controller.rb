class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = category.new(category_strong_params)
    @category.save
  end

  def edit
  end

  def update
    @category.update
  end

  def destroy
    @category.destroy
    redirect_to home
  end

    private

  def set_recipe
    @category = Category.find(params[:id])
  end

  def recipe_strong_params
    params.require(:category).permit(:name)

  end

end
