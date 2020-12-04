class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :name
      t.string :username
      t.string :password
      t.string :role
      t.timestamps
    end
  end
end
