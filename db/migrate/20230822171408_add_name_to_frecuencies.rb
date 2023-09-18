class AddNameToFrecuencies < ActiveRecord::Migration[5.2]
  def change
    add_column :frecuencies, :name, :string
  end
end
