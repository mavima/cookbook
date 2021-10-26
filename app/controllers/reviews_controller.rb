class ReviewsController < ApplicationController

 before_action :set_review, only: [:edit, :update, :destroy]
  def new
    @review = Review.new
    @recipe = Recipe.find(params[:recipe_id])
    authorize @review
  end

  def create
    @review = Review.new(review_strong_params)
    @review.user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe = @recipe
    if @review.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
    authorize @review
  end

  def edit
    @review = Review.find(params[:id])
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    authorize @review
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    if @review.update(review_strong_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
   authorize @review
  end

  def destroy
    @review = Review.find(params[:id])
    @user = current_user
    @review.destroy
    redirect_to user_path(@user)
    authorize @review
  end

  private

  def set_review
    @review = Review.find_by(id:[params[:id], params[:review_id]])
    @recipe = @review.recipe
  end

  def review_strong_params
    params.require(:review).permit(:content, :rating, :photo, :user_id, :recipe_id)
  end
end
