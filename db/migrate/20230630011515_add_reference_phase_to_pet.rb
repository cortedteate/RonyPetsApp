class AddReferencePhaseToPet < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :quantity, foreign_key: true
  end
end
