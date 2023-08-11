class AddReferencesToQuantity < ActiveRecord::Migration[5.2]
  def change
    add_reference :quantities, :size, foreign_key: true
  end
end
