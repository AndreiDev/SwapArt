json.array!(@blocks) do |block|
  json.extract! block, :id, :user_id, :item_id
  json.url block_url(block, format: :json)
end
