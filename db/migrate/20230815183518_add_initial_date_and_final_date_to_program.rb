class AddInitialDateAndFinalDateToProgram < ActiveRecord::Migration[5.2]
  def self.up
    add_column :programs, :initial_date, :date
  end

  def self.down
    remove_column :programs, :initial_date
  end
end
