class AddBlockedToCircle < ActiveRecord::Migration
  def change
    add_column :circles, :blocked, :boolean
  end
end
