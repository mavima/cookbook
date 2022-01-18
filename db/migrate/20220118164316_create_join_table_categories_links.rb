class CreateJoinTableCategoriesLinks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :links do |t|
      # t.index [:category_id, :link_id]
      # t.index [:link_id, :category_id]
    end
  end
end
