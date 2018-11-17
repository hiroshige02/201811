class AddDeskNumberToDesks < ActiveRecord::Migration[5.2]
  def change
    add_column :desks, :desk_number, :integer
    add_column :desks, :start, :datetime
    add_column :desks, :finish, :datetime
    add_column :desks, :event_id, :integer
    remove_column :desks, :desk, :integer
  end
end
