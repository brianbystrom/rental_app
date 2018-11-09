class AddRatingsToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :buyer_rating, :integer
    add_column :rentals, :seller_rating, :integer
  end
end