class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :text
      t.string :user_id

      t.timestamps
    end
  end
end
