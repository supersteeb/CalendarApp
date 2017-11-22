class AddDefaultToTodoitem < ActiveRecord::Migration[5.0]
  def change
    change_column :todoitems, :is_done, :boolean, default: false
  end
end
