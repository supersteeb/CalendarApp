class CreateTodolists < ActiveRecord::Migration[5.0]
  def change
    create_table :todolists do |t|
      t.integer :percent

      t.timestamps
    end
  end
end
