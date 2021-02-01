class AddColumnsToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :rating, :integer
    add_column :recipes, :time, :integer
    add_column :recipes, :portions, :integer
  end
end
