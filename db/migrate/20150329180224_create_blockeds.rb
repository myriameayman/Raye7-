class CreateBlockeds < ActiveRecord::Migration
  def change
    create_table :blockeds do |t|
      t.integer :friend_id

      t.timestamps
    end
  end
end
