json.extract! rental, :id, :user_id, :item_id, :rental_start_date, :rental_end_date, :buyer_checkin_confirm, :seller_checkin_confirm, :total_price, :assistance, :comment, :created_at, :updated_at
json.url rental_url(rental, format: :json)
