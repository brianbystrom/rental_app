class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :serial_no
      t.string :name
      t.string :tag
      t.string :location
      t.float :price
      t.string :brand
      t.string :model
      t.boolean :status

      t.timestamps
    end
  end
end
