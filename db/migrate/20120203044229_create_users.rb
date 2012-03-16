class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :email
      t.string :password
      t.string :api_key
      t.timestamps
    end
  end
end
