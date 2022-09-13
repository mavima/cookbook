class AddSubtitleToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :subtitle, :string
  end
end
