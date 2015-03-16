class ChangingStringToIntegerForTheTwoIdsInOrder < ActiveRecord::Migration
  def change
  	change_table :orders do |t|
  		t.change :shipping_from_id, :integer
  		t.change :shipping_to_id, :integer
  	end
  end
end
