json.array!(@taggings) do |tagging|
  json.extract! tagging, :id, :item_id, :tag_id
  json.url tagging_url(tagging, format: :json)
end
