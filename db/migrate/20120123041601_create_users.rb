class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id, :primary => true
      t.string :username
      t.string :password
      t.integer :level

      t.timestamps
    end
  end
end
