class AddPoundPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :pound_price, :numeric
  end
end
