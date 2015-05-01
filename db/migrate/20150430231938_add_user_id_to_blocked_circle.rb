class AddUserIdToBlockedCircle < ActiveRecord::Migration
  def change
    add_column :blocked_circles, :user_id, :string
  end
end
