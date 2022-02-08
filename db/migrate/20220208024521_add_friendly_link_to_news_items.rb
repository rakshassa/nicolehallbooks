class AddFriendlyLinkToNewsItems < ActiveRecord::Migration[5.2]
  def change
    add_column :news_items, :friendly_link, :string, null: true, limit: 25
  end
end
