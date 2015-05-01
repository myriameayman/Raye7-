class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, :precision => 12, :scale => 3
      t.decimal :tax, :precision => 12, :scale => 3
      t.decimal :shipping, :precision => 12, :scale => 3
      t.decimal :total, :precision => 12, :scale => 3
      t.references :order_status

      t.timestamps
    end
    add_index :orders, :order_status_id
  end
end
