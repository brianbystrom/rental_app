class ChangeLongitutdeToLongitudeInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :longitutde, :longitude
  end
end
