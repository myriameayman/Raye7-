class RemoveBlockedFromCircle < ActiveRecord::Migration
  def up
    remove_column :circles, :blocked
  end

  def down
    add_column :circles, :blocked, :boolean
  end
end
