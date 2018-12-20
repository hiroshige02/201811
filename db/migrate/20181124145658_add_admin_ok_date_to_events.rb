class AddAdminOkDateToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :admin_ok_date, :datetime
  end
end
