class AddDeliveredDateToProgram < ActiveRecord::Migration[5.2]
  def self.up
    add_column :programs, :delivered_date, :date
  end

  def self.down
    remove_column :programs, :delivered_date
  end
end
