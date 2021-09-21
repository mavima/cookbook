class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :reviews
  has_many :favourites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def favourited?(recipe)
    self.favourites.find_by(recipe_id: recipe.id).present?
  end

  def get_fav_instances(recipe)
    self.favourites.find_by(recipe_id: recipe.id)
  end

  def commented?(recipe)
    self.comments.find_by(recipe_id: recipe.id).present?
  end

  def get_comment_instances(recipe)
    self.comments.find_by(recipe_id: recipe.id)
  end

  def favourite(recipe)
    favourites.find_or_create_by(recipe: recipe)
  end

  def unfavourite(recipe)
    favourites.where(recipe: recipe).destroy_all
    recipe.reload
  end

end
