class RenameFieldTypeToNameInSize < ActiveRecord::Migration[5.2]
  def change
    rename_column :sizes, :type, :size
  end
end
