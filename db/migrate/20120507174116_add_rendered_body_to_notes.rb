class AddRenderedBodyToNotes < ActiveRecord::Migration
  def up
    add_column :notes, :rendered_body, :string
  end

  def down
    remove_column :notes, :rendered_body
  end
end
