class AddPhaseToPet < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :phase, :string
  end
end
