class Category < ApplicationRecord
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
  has_many :link_categories
  has_many :links, through: :link_categories

end
