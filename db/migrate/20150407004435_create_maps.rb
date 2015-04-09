class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.decimal :long
      t.decimal :lat

      t.timestamps
    end
  end
end
