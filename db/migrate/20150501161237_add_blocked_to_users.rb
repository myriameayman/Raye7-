class AddBlockedToCircles < ActiveRecord::Migration
  def change
    add_column :circles, :blocked, :boolean,:default => false
  end
end
