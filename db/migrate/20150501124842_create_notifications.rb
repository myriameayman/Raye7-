class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notifying
      t.string :notified
      t.string :text

      t.timestamps
    end
  end
end
