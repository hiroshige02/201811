class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :finish_time
      t.string :title
      t.integer :regist_user_id
      t.text :content
      t.boolean :admin_ok
      t.text :admin_message
      t.boolean :admin_no
      t.integer :participand
      t.integer :event_image_id

      t.timestamps
    end
  end
end
