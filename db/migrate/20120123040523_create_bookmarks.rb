class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :id, :primary => true
      t.string :url
      t.text :notes
      t.integer :category_id
      t.integer :user_id
      t.boolean :public
      t.timestamps
    end
  end
end
