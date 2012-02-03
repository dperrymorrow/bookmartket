class BookmarksTags < ActiveRecord::Migration
  def change
    create_table :bookmarks_tags do |t|
      t.integer :bookmark_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
