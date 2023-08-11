class RemoveReferenceFromBreedToSize < ActiveRecord::Migration[5.2]
  def change
    remove_reference :breeds, :size, foreign_key: true
  end
end
