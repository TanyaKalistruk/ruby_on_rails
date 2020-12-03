class CreateProstorItems < ActiveRecord::Migration[6.0]
  def change
    create_table :prostor_items do |t|
      t.integer :item_id
      t.string :item_name
      t.integer :price
      t.timestamps
    end
  end
end
