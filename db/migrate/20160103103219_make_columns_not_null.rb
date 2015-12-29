class MakeColumnsNotNull < ActiveRecord::Migration
  def change
    change_table :authors, bulk: true do |t|
      t.change :first_name, :string, null: false
      t.change :last_name, :string, null: false
      t.change :biography, :text, null: false
    end

    change_table :books, bulk: true do |t|
      t.change :title, :string, null: false
      t.change :description, :text, null: false
      t.change :published_at, :datetime, null: false
      t.change :cover_url, :string, null: false
    end

    change_table :lists, bulk: true do |t|
      t.change :title, :string, false: false
    end
  end
end
