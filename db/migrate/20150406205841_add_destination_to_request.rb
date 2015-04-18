class AddDestinationToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :destination, :string
  end
end
