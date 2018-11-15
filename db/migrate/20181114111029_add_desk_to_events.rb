class AddDeskToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :desk, :integer
  end
end
