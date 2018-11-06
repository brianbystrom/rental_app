class AddAddressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :latitude, :float
    add_column :users, :longitutde, :float
  end
end
