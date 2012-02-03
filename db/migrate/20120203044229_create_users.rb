class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :password
      t.integer :password
      t.integer :account_id
      t.timestamps
    end
  end
end
