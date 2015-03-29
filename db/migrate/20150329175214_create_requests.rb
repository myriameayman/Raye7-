class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.decimal :long_destination
      t.decimal :lat_destination
      t.decimal :long_curr
      t.decimal :lat_curr
      t.string :car_color
      t.string :car_model
      t.string :car_number
      t.integer :seats
      t.boolean :air_conditioner
      t.boolean :smoking
      t.boolean :trunk

      t.timestamps
    end
  end
end
