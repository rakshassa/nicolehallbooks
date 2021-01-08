class AddPiclinkToNewsItem < ActiveRecord::Migration[5.2]
  def change
  	add_column :news_items, :piclink, :string, limit: 250, null: true
  end
end
