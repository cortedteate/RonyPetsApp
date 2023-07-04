class AddKindReferencesToBreed < ActiveRecord::Migration[5.2]
  def change
    add_reference :breeds, :kind, foreign_key: true
  end
end
