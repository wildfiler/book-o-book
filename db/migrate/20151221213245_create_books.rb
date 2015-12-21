class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.datetime :published_at
      t.string :cover_url
    end
  end
end
