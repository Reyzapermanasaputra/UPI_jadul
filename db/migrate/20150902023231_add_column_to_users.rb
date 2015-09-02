class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :identity, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
  end
end
