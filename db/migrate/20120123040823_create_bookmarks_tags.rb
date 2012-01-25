class CreateBookmarksTags < ActiveRecord::Migration
  def up
    create_table :bookmarks_tags do |t|
      t.integer :id, :primary => true
      t.integer :bookmark_id
      t.integer :tag_id
      t.timestamps
    end
  end

  def down
  end
end
