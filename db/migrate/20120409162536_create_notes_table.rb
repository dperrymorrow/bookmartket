class CreateNotesTable < ActiveRecord::Migration
  def up
    create_table :notes do |t|
      t.integer :id
      t.integer :user_id
      t.string :title
      t.string :body
      t.timestamps
    end
  end

  def down
  end
end
