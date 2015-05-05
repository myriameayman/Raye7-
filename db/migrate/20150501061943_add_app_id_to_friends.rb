class AddAppIdToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :app_id, :integer
  end
end
