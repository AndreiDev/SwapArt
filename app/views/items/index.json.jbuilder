json.array!(@items) do |item|
  json.extract! item, :id, :user_id, :type_id, :description, :original_price, :height, :width, :age_id, :state_id, :is_active?, :is_blocked?
  json.url item_url(item, format: :json)
end
