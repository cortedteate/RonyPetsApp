class RemoveReferencesClientsToPet < ActiveRecord::Migration[5.2]
  def change
    remove_reference :pets, :client, foreign_key: true
  end
end
