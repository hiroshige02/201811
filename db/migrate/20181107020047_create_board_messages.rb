class CreateBoardMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :board_messages do |t|
      t.integer :send_user_id
      t.integer :receive_user_id
      t.text :body

      t.timestamps
    end
  end
end
