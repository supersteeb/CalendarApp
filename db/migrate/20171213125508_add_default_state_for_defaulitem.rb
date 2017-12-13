class AddDefaultStateForDefaulitem < ActiveRecord::Migration[5.0]
  def change
  	change_column :defaultitems, :state, :integer, default: 0
  end
end
