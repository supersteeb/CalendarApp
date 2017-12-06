class AddResultToTodoitem < ActiveRecord::Migration[5.0]
  def change
    add_column :todoitems, :result, :text
  end
end
