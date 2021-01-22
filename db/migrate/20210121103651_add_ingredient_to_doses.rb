class AddIngredientToDoses < ActiveRecord::Migration[6.0]
  def change
    add_column :doses, :ingredient, :string
  end
end
