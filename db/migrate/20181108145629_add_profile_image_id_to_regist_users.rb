class AddProfileImageIdToRegistUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :regist_users, :profile_image_id, :text
  end
end
