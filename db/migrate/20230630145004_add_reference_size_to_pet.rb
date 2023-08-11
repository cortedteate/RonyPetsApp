class AddReferenceSizeToPet < ActiveRecord::Migration[5.2]
  def change
    add_reference :pets, :size, foreign_key: true
  end
end
