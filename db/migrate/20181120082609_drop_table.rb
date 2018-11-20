class DropTable < ActiveRecord::Migration[5.2]
  def change
  	drop_table :desk_events
  	remove_column :regist_users, :introduction, :text
  end
end
