class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :sender_id
      t.integer :taker_id
      t.string :shipping_from_address
      t.string :shipping_from_city
      t.string :shipping_from_state
      t.string :shipping_to_address
      t.string :shipping_to_city
      t.string :shipping_to_state
      t.text :notes
      t.decimal :miles, precision: 6, scale: 1
      t.decimal :kilometer, precision: 6, scale: 1
      t.datetime :pickup_date
      t.datetime :dropoff_date
      t.integer :packages
      t.decimal :subtotal, precision: 7, scale: 2
      t.decimal :tax, precision: 6, scale: 2
      t.decimal :total, precision: 7, scale: 2
      t.boolean :confirmed

      t.timestamps null: true
    end
  end
end
