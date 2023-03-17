class RenameDecriptionToDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :decription, :description
  end
end
