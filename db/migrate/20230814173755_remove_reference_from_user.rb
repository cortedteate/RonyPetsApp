class RemoveReferenceFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :client, foreign_key: true
  end
end
