class RemoveInstructionFromRecipe < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :instruction, :text
  end
end
