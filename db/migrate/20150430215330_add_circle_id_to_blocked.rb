class AddCircleIdToBlocked < ActiveRecord::Migration
  def change
    add_column :blockeds, :circle_id, :string
  end
end
