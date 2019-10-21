json.extract! receipt, :id, :location, :date, :total_cost, :tax, :image, :receipt_owner, :receipt_tag_id, :fatura_id, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
