class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :Firstname, :string
    add_column :users, :Lastname, :string
    add_column :users, :avatar, :string
    add_column :users, :admin, :boolean
  end
end
