class CreateFrecuencies < ActiveRecord::Migration[5.2]
  def change
    create_table :frecuencies do |t|
      t.integer :days

      t.timestamps
    end
  end
end
