class LinksController < ApplicationController
   before_action :set_link, only: [:edit, :update, :destroy]

  def new
    @link = Link.new
    authorize @link
  end

  def create
    @user = current_user
    @link = Link.new(link_strong_params)
    @link.user = current_user
    if @link.save
      redirect_to user_path(@user)
    else
      render :new
    end
    authorize @link
  end

  def edit
    @user = current_user
  end

  def update
    if @link.update(link_strong_params)
        user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @link.destroy
    redirect_to user_path(@user)
  end

  private

  def set_link
    @link = Link.find_by(id:[params[:id], params[:link_id]])
    authorize @link
  end

  def link_strong_params
    params.require(:link).permit(:url, :image, :user_id, :note, :category_ids => [])
  end
end
