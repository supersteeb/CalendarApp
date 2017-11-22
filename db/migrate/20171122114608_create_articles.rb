class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :name, index: true
      t.date :published_on, index: true
      t.text :content

      t.timestamps
    end
  end
end
