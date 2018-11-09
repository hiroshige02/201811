class CreateDeskEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :desk_events do |t|
      t.integer :event_id
      t.integer :desk_id

      t.timestamps
    end
  end
end
