class AddReferenceToPetToBreed < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :breed, foreign_key: true
  end
end
