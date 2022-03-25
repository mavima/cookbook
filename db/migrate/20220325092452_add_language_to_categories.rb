class AddLanguageToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :language, :string
  end
end
