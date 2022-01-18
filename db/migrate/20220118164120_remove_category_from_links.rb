class RemoveCategoryFromLinks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :links, :category, null: false, foreign_key: true
  end
end
