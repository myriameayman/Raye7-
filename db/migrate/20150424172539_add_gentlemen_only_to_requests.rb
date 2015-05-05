class AddGentlemenOnlyToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :gentlemen_only, :boolean
  end
end
