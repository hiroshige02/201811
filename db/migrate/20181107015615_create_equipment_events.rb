class CreateEquipmentEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment_events do |t|
      t.integer :event_id
      t.integer :equipment_id

      t.timestamps
    end
  end
end
