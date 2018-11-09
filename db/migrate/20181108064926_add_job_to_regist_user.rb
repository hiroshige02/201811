class AddJobToRegistUser < ActiveRecord::Migration[5.2]
  def change
    add_column :regist_users, :job, :string
  end
end
