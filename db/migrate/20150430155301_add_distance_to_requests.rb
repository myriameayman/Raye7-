class AddDistanceToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :distance, :integer
  end
end
