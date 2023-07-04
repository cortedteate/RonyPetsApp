class AddWeightToSize < ActiveRecord::Migration[5.2]
  def change
    add_column :sizes, :weight, :string
  end
end
