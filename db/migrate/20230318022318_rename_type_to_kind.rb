class RenameTypeToKind < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :type, :kind
  end
end
