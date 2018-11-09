class CreatePastEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :past_events do |t|
      t.datetime :past_start_time
      t.datetime :past_finish_time
      t.string :past_title
      t.text :past_content
      t.string :past_name
      t.string :past_user_mail_address
      t.integer :past_participant
      t.integer :past_event_image_id

      t.timestamps
    end
  end
end
