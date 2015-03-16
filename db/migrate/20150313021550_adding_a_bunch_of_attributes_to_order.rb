class AddingABunchOfAttributesToOrder < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.datetime :deadline
  		t.string :shipping_from_id
  		t.string :shipping_to_id
  	end
  end
end
