json.extract! item, :id, :user_id, :serial_no, :name, :tag, :location, :price, :brand, :model, :status, :created_at, :updated_at
json.url item_url(item, format: :json)
