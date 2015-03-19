class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.timestamps null: false
    end
  end
end