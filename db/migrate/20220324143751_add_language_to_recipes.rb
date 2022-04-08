class AddLanguageToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :language, :string,
    add_column :recipes, :default, :string
    add_column :recipes, :english, :string
  end
end
