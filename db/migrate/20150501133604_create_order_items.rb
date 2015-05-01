class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :product
      t.references :order
      t.decimal :unit_price, :precision => 12, :scale => 3
      t.integer :quantity
      t.decimal :total_price, :precision => 12, :scale => 3

      t.timestamps
    end
    add_index :order_items, :product_id
    add_index :order_items, :order_id
  end
end
