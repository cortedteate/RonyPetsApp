class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :user_id
      t.decimal :amount

      t.timestamps
    end
  end
end
