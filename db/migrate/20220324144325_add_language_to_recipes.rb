class AddLanguageToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :language, :string
  end
end
