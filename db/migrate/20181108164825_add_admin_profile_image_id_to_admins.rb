class AddAdminProfileImageIdToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :admin_profile_image_id, :text
  end
end
