json.array!(@wants) do |want|
  json.extract! want, :id, :user_id, :item_id, :extra_mile
  json.url want_url(want, format: :json)
end
