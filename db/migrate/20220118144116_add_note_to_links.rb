class AddNoteToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :note, :string
  end
end
