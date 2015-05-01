class CreateBlockedCircles < ActiveRecord::Migration
  def change
    create_table :blocked_circles do |t|
      t.string :circle_id

      t.timestamps
    end
  end
end
