class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.integer :fb_id
      t.integer :circle_id

      t.timestamps
    end
  end
end
