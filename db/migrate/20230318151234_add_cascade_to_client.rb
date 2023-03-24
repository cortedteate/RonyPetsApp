class AddCascadeToClient < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key  :pets, :clients, on_delete: :cascade
  end
end
