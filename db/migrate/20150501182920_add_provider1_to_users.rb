class AddProvider1ToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provide1, :string
  end
end
