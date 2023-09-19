class RenameFieldTypeToNameInSizes < ActiveRecord::Migration[5.2]
  def change
    rename_column :sizes, :size, :name
  end
end
