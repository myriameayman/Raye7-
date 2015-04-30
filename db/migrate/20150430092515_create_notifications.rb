class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :notifying
      t.integer :notified
      t.string :text

      t.timestamps
    end
  end
end
