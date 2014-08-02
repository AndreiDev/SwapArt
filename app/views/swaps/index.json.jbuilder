json.array!(@swaps) do |swap|
  json.extract! swap, :id, :user1_id, :user2_id, :user1_items, :user2_items
  json.url swap_url(swap, format: :json)
end
