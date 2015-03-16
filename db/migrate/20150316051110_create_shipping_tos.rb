class CreateShippingTos < ActiveRecord::Migration
  def change
    create_table :shipping_tos do |t|
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps null: true
    end
  end
end
