class CreateShippingFroms < ActiveRecord::Migration
  def change
    create_table :shipping_froms do |t|
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: true
    end
  end
end
