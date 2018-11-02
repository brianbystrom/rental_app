require "application_system_test_case"

class RentalsTest < ApplicationSystemTestCase
  setup do
    @rental = rentals(:one)
  end

  test "visiting the index" do
    visit rentals_url
    assert_selector "h1", text: "Rentals"
  end

  test "creating a Rental" do
    visit rentals_url
    click_on "New Rental"

    fill_in "Assistance", with: @rental.assistance
    fill_in "Buyer Checkin Confirm", with: @rental.buyer_checkin_confirm
    fill_in "Comment", with: @rental.comment
    fill_in "Item", with: @rental.item_id
    fill_in "Rental End Date", with: @rental.rental_end_date
    fill_in "Rental Start Date", with: @rental.rental_start_date
    fill_in "Seller Checkin Confirm", with: @rental.seller_checkin_confirm
    fill_in "Total Price", with: @rental.total_price
    fill_in "User", with: @rental.user_id
    click_on "Create Rental"

    assert_text "Rental was successfully created"
    click_on "Back"
  end

  test "updating a Rental" do
    visit rentals_url
    click_on "Edit", match: :first

    fill_in "Assistance", with: @rental.assistance
    fill_in "Buyer Checkin Confirm", with: @rental.buyer_checkin_confirm
    fill_in "Comment", with: @rental.comment
    fill_in "Item", with: @rental.item_id
    fill_in "Rental End Date", with: @rental.rental_end_date
    fill_in "Rental Start Date", with: @rental.rental_start_date
    fill_in "Seller Checkin Confirm", with: @rental.seller_checkin_confirm
    fill_in "Total Price", with: @rental.total_price
    fill_in "User", with: @rental.user_id
    click_on "Update Rental"

    assert_text "Rental was successfully updated"
    click_on "Back"
  end

  test "destroying a Rental" do
    visit rentals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rental was successfully destroyed"
  end
end
