class RemoveNombreFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :nombre, :string
  end
end
