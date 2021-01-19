class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :photo
      t.integer :portion
      t.text :description
      t.text :instruction

      t.timestamps
    end
  end
end
