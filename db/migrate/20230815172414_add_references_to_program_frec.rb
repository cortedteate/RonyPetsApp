class AddReferencesToProgramFrec < ActiveRecord::Migration[5.2]
  def change
    remove_column :programs, :frecuency, :integer
    add_reference :programs, :frecuency, foreign_key: true
  end
end
