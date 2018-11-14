class AddApprovalToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :approval, :boolean
  end
end
