class AddFbIdToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :fb_id, :integer
  end
end
