class AddGmailToUsers < ActiveRecord::Migration
	  def change
    	add_column :users, :gmail, :string
  	  end
end
