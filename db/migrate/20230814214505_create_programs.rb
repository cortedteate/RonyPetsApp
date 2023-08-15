class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.references :pet, foreign_key: true
      t.references :product, foreign_key: true
      t.references :quantity, foreign_key: true
      t.integer :frecuency
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
