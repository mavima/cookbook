class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :Firstname, :first_name
    rename_column :users, :Lastname, :last_name
  end
end
