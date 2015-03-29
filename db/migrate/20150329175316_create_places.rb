class CreatePlaces < ActiveRecord::Migration
		def change
    	create_table :places do |t|
      	t.decimal :long
      	t.decimal :lat
      	t.string :name

      	t.timestamps
    		end
  		end
end
