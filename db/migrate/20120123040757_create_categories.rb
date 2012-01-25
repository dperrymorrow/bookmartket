class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :id, :primary => true
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
