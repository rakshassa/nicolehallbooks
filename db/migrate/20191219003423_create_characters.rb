class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :identifier, limit: 50, null: false
      t.string :name, limit: 50, null: false
      t.integer :playable, null: false, default: 0
      t.string :description, null: false
      t.integer :unlock_at, null: false, default: 1
      t.string :basic_name, limit: 50, null: true
      t.text :basic_texts, array: true, null: true
      t.string :special_name, limit: 50, null: true
      t.text :special_texts, array: true, null: true
      t.integer :special_starts, array: true, null: true
      t.integer :special_costs, array: true, null: true
      t.string :ultimate_name, limit: 50, null: true
      t.text :ultimate_texts, array: true, null: true
      t.integer :ultimate_starts, array: true, null: true
      t.integer :ultimate_costs, array: true, null: true
      t.string :passive_name, limit: 50, null: true
      t.text :passive_texts, array: true, null: true

      t.timestamps
    end

    add_index :characters, :identifier, unique: true
  end
end
