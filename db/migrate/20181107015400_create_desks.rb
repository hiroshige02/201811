class CreateDesks < ActiveRecord::Migration[5.2]
  def change
    create_table :desks do |t|
      t.integer :desk

      t.timestamps
    end
  end
end
