class AddReferencesToPet < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :kind, foreign_key: true
  end
end
