class AddNametoBreed < ActiveRecord::Migration[5.2]
  def change
    add_column :breeds, :size, :string
  end
end
