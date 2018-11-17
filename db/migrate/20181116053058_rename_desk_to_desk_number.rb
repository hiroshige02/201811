class RenameDeskToDeskNumber < ActiveRecord::Migration[5.2]
  def change
    rename_table :desks, :desk_numbers
  end
end
