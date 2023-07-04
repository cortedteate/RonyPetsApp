class ModifySizeTable < ActiveRecord::Migration[5.2]
  def change 
    rename_table :sizes, :quantities
  end
end
