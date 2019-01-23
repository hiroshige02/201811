class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.integer :equipment_number
      t.string :equipment
      t.integer :dummy_id
      t.timestamps
    end
  end
end
