class Category < ApplicationRecord
  has_and_belongs_to_many :links
  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories
end
