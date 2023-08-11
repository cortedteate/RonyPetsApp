class RemoveWeightFromQuantity < ActiveRecord::Migration[5.2]
  def change
    remove_column :quantities, :weight, :string
  end
end
