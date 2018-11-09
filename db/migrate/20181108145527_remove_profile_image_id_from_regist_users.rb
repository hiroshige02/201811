class RemoveProfileImageIdFromRegistUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :regist_users, :profile_image_id, :integer
  end
end
