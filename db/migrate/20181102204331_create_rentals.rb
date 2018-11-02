class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.integer :user_id
      t.integer :item_id
      t.datetime :rental_start_date
      t.datetime :rental_end_date
      t.boolean :buyer_checkin_confirm
      t.boolean :seller_checkin_confirm
      t.float :total_price
      t.boolean :assistance
      t.text :comment

      t.timestamps
    end
  end
end
