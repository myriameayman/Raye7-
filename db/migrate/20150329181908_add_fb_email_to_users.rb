class AddFbEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_email, :string
  end
end
