class RemoveNameToQuantities < ActiveRecord::Migration[5.2]
  def change
    remove_column :quantities, :name, :string
  end
end
