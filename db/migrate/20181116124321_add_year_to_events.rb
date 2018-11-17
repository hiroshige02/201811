class AddYearToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :year, :integer
    add_column :events, :month, :integer
    add_column :events, :day, :integer
  end
end
