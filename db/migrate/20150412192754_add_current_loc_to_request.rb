class AddCurrentLocToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :currentLoc, :string
  end
end
