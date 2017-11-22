class CreateToDoItems < ActiveRecord::Migration[5.0]
  def change
    create_table :to_do_items do |t|
      t.references :to_do_lists, foreign_key: true
      t.string :name
      t.boolean :is_done
      t.text :desc

      t.timestamps
    end
  end
end
