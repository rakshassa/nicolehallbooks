class AddSeriesToBooks < ActiveRecord::Migration[5.2]
  def change
  	add_column :news_items, :book_number, :integer, null: false, default: 0
  	add_reference :news_items, :group, null: true, index: true, foreign_key: true
  end
end
