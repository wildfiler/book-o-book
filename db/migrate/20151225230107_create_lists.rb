class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title

      t.timestamps
    end

    create_table :list_entries do |t|
      t.references :book, index: true, foreign_key: true, null: false
      t.references :list, index: true, foreign_key: true, null: false

      t.index [:book_id, :list_id], unique: true
    end
  end
end
