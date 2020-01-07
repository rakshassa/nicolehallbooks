class CreateNewsLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :news_links do |t|
      t.references :news_item, index: true, foreign_key: true, null: false
      t.string :caption, limit: 50, null: false
      t.string :url, limit:200, null: false

      t.timestamps
    end
  end
end
