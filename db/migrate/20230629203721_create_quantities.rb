class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :quantities do |t|
      t.string :type
      t.string :weight
      t.string :phase
      t.string :age
      t.integer :quantity

      t.timestamps
    end
  end
end
