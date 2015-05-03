class AddDefaultValueToBudget < ActiveRecord::Migration
	def up
		change_column :users, :budget, :integer, :default => 1000
	end

	def down
		change_column :users, :budget, :integer, :default => 0
	end
end
