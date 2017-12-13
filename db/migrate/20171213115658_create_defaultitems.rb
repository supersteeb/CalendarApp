class CreateDefaultitems < ActiveRecord::Migration[5.0]
  def change
    create_table :defaultitems do |t|
      t.string :name
      t.text :desc
      t.integer :state

      t.timestamps
    end
  end
end
