class AddDomainToBookmark < ActiveRecord::Migration
  def up
    add_column :bookmarks, :domain, :string
  end

  def down
    remove_column :bookmarks, :domain
  end
end
