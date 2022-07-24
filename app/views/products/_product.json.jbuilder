json.extract! product, :id, :name, :price, :expiration, :currency_id, :created_at, :updated_at
json.url product_url(product, format: :json)
