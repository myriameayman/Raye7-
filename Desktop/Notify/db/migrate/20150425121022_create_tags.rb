class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :current_user
      t.integer :user_id
      t.integer :request_id

      t.timestamps
    end
  end
end
