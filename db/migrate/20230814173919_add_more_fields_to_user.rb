class AddMoreFieldsToUser < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
  end

  def self.down
    remove_column :users, :name
    remove_column :users, :address
    remove_column :users, :phone
  end
end
