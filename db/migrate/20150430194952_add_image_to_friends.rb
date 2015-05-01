class AddImageToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :image, :string
  end
end
