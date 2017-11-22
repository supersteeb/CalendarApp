class CreateTodoitems < ActiveRecord::Migration[5.0]
  def change
    create_table :todoitems do |t|
      t.references :todolist, foreign_key: true
      t.string :name
      t.boolean :is_done
      t.text :desc

      t.timestamps
    end
  end
end
