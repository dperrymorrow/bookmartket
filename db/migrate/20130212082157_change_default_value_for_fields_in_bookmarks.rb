class ChangeDefaultValueForFieldsInBookmarks < ActiveRecord::Migration
  def up
	change_column :bookmarks, :notes, :string, :default => ""
  	Bookmark.update_all({ :notes => "" }, { :notes => nil })
  end

  def down
  	change_column :bookmarks, :notes, :string, :default => nil
  end
end
