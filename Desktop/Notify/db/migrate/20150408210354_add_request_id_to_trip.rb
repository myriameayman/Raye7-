class AddRequestIdToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :request_id, :integer
  end
end
