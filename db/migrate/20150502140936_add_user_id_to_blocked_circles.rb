class AddUserIdToBlockedCircles < ActiveRecord::Migration
  def change
    add_column :blocked_circles, :user_id, :integer
  end
end
