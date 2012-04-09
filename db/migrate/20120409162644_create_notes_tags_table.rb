class CreateNotesTagsTable < ActiveRecord::Migration
  def up
   create_table :notes_tags do |t|
      t.integer :note_id
      t.integer :tag_id
      t.timestamps
    end
  end

  def down
  end
end
