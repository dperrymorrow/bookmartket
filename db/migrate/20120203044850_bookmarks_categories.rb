class BookmarksCategories < ActiveRecord::Migration
  def change
    create_table :bookmarks_categories do |t|
      t.integer :bookmark_id
      t.integer :category_id
      t.timestamps
    end
  end
end
