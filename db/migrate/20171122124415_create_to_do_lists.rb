class CreateToDoLists < ActiveRecord::Migration[5.0]
  def change
    create_table :to_do_lists do |t|
      t.integer :percent_complete

      t.timestamps
    end
  end
end
