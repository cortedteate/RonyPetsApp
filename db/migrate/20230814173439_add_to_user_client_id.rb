class AddToUserClientId < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :client, foreign_key: true
  end
end
