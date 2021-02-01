class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.text :detail
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
