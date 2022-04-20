class UsersController < ApplicationController

  def show
    @links = Link.all.where(user: current_user)  
    if params[:query].present? && params[:category].blank? 
      @links = @links.search_by_link_title(params[:query]) 
    elsif params[:query].present? && params[:category][:id].blank?
      @links = @links.search_by_link_title(params[:query]) 
    elsif params[:category].present? && params[:query].blank?
      my_cat = Category.find_by_id(params[:category][:id].to_i)
      @links = @links.select { |link| link.categories.include?(my_cat) }
    elsif params[:category].present? && params[:query].present?
      @links = @links.search_by_link_title(params[:query]) 
      my_cat = Category.find_by_id(params[:category][:id].to_i)
      @links = @links.select { |recipe| recipe.categories.include?(my_cat) }
    else
      @links = @links.order(:title)
    end 
    authorize current_user
  end

  def favourited?(recipe)
    self.favourites.find_by(recipe_id: recipe.id).present?
  end

  def get_fav_instances(recipe)
    self.favourites.find_by(recipe_id: recipe.id)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :avatar, :admin)
  end
end
