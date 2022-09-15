
class CommentsController < ApplicationController
   before_action :set_comment, only: [ :destroy]

  def new
    @comment = Comment.new
    @recipe = Recipe.find(params[:recipe_id])
    authorize @comment
  end

  def create
    @comment = Comment.new(comment_strong_params)
    @comment.user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @comment.recipe = @recipe
    if @comment.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
    authorize @comment
  end

  def edit
    @comment = Comment.find(params[:id])
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    authorize @comment
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_strong_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
    authorize @comment
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    # @comment = Comment.find(params[:id])
    @user = current_user
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end

  private

  def set_comment
    @comment = Comment.find_by(id:[params[:id], params[:comment_id]])
    # @recipe = @comment.recipe
    authorize @comment
  end

  def comment_strong_params
    params.require(:comment).permit(:content, :user_id, :recipe_id)
  end
end
