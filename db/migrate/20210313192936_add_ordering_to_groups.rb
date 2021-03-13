class AddOrderingToGroups < ActiveRecord::Migration[5.2]
  def change
  	add_column :groups, :ordering, :integer, null: false, default: 0
  end
end
