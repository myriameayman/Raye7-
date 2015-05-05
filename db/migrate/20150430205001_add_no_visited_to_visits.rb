class AddNoVisitedToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :noVisited, :integer
  end
end
