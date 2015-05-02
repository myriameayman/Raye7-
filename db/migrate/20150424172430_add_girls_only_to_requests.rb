class AddGirlsOnlyToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :girls_only, :boolean
  end
end
