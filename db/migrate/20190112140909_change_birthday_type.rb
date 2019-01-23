class ChangeBirthdayType < ActiveRecord::Migration[5.2]
  def change
    change_column :regist_users, :birthday, :integer
  end
end
