class AddSecretToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :secret, :string, limit: 25, null: true
  end
end
