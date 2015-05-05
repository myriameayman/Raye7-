class CreateCheckpoints < ActiveRecord::Migration
  def change
    create_table :checkpoints do |t|
      t.integer :request_id
      t.integer :place_id

      t.timestamps
    end
  end
end
