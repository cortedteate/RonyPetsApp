class CreateWarehouseRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouse_records do |t|
      t.integer :user_id
      t.integer :quantity
      t.references :supplier, foreign_key: true
      t.references :products, foreign_key: true

      t.timestamps
    end
  end
end
