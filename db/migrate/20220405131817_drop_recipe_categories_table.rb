class DropRecipeCategoriesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :recipe_categories
  end
end
