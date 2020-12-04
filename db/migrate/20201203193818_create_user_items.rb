class CreateUserItems < ActiveRecord::Migration[6.0]
  def change
    create_table :user_items do |t|
      t.belongs_to :user
      t.belongs_to :prostor_item
      t.integer :count
      t.timestamps
    end
  end
end
