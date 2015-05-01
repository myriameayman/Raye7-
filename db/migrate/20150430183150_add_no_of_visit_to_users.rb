class AddNoOfVisitToUsers < ActiveRecord::Migration
  def change
    add_column :users, :noOfVisit, :integer
  end
end
