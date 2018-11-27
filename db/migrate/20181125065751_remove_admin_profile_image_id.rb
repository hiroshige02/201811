class RemoveAdminProfileImageId < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :admin_profile_image_id, :text
    remove_column :regist_users, :introduction, :text
  end
end
