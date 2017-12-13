class AddDefaultPercentForTodolist < ActiveRecord::Migration[5.0]
  def change
  	change_column :todolists, :percent, :integer, default: 0
  end
end
