class AddCascadeToClientId < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key  :pets, :clients
  end
end
