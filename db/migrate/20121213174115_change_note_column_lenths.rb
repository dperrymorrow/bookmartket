class ChangeNoteColumnLenths < ActiveRecord::Migration
  def up
    change_column :notes, :body, :text
    change_column :notes, :rendered_body, :text
  end

  def down
    change_column :notes, :body, :string
    change_column :notes, :rendered_body, :string
  end
end
