class AddTitleToBookmarks < ActiveRecord::Migration
  def up
    add_column :bookmarks, :title, :string
  end

  def down
    remove_column :bookmarks, :title
  end
end
