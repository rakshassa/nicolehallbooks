class CreateNewsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :news_items do |t|
      t.string :title, limit: 100, null: false
      t.text :body
      t.datetime :posted_date

      t.timestamps
    end
  end
end
