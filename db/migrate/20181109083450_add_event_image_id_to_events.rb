class AddEventImageIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_image_id, :text
    add_column :events, :participant, :integer
  end
end
