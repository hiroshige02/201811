class RemoveEventImageIdFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :event_image_id, :integer
    remove_column :events, :participand, :integer
  end
end
