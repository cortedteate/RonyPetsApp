class AddReferenceToPet < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :age, :string
  end
end
