class ChangingShippingToToShippingTos < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.rename :shipping_from_id, :shipping_froms_id
  		t.rename :shipping_to_id, :shipping_tos_id
  	end
  end
end
