class AddAssistanceReasonToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :assistance_reason, :string
  end
end
