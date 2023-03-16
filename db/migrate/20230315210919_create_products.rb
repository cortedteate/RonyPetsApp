class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :decription
      t.integer :existence
      t.decimal :price
      t.string :image
      t.references :categories, foreign_key: true
      t.references :suppliers, foreign_key: true

      t.timestamps
    end
  end
end
