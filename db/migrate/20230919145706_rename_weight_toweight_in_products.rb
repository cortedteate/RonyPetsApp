class RenameWeightToweightInProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :Weight, :weight
  end
end
