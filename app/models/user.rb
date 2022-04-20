class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes
  has_many :reviews
  has_many :favourites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :links, dependent: :destroy
  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :email, presence: true, on: :update
 
  # include PgSearch::Model
  # pg_search_scope :search_by_link_name_and_category,
  #   associated_against: {
  #     links: :title,
  #     associated_against: {
  #       categories: :name
  #     }
  #   },

  #   using: {
  #     tsearch: {prefix: true }
  #   }

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

  def destroy
    update_attributes(deactivated: true) unless deactivated
  end

  def active_for_authentication?
    super && !deactivated
  end

end
