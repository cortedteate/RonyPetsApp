class RemoveReferenceFromPet < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pets, :quantity, foreign_key: true
  end
end
