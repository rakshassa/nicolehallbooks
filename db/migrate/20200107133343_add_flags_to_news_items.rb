class AddFlagsToNewsItems < ActiveRecord::Migration[5.2]
  def change
    add_column :news_items, :is_news, :boolean, default: false
    add_column :news_items, :is_book, :boolean, default: false
  end
end
