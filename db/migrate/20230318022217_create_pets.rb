class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.string :breed
      t.string :age
      t.integer :duration
      t.date :last_purchase
      t.references :product, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
