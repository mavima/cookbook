class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :reviews
  has_many :favourites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def favorited?(recipe)
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

end
