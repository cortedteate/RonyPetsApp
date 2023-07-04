class DeleteBreedFieldFromPet < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :breed, :string
  end
end
