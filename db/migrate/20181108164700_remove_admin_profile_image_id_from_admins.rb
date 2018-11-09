class RemoveAdminProfileImageIdFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :admin_profile_image_id, :integer
  end
end
