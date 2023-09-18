class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true
      t.references :product, foreign_key: true
      t.references :frecuency, foreign_key: true
      t.references :quantity, foreign_key: true
      t.date :initial_date
      t.date :delivered_date

      t.timestamps
    end
  end
end
