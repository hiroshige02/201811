class CreateDummies < ActiveRecord::Migration[5.2]
  def change
    create_table :dummies do |t|
      t.timestamps
    end
  end
end
