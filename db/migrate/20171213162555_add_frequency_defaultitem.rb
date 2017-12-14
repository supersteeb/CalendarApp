class AddFrequencyDefaultitem < ActiveRecord::Migration[5.0]
  def change
  	add_column :defaultitems, :frequency, :string, array: true, default: []
  end
end
