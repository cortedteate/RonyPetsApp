class AddReferencesToBreed < ActiveRecord::Migration[5.2]
  def change
    remove_column :breeds, :size, :string
    add_reference :breeds, :size, foreign_key: true    
  end
end
