class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :seller

      t.timestamps
    end
  end
end
