class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :id
      t.integer :user_id
      t.string :url
      t.string :notes
      t.timestamps
    end
  end
end
