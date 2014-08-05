json.array!(@users) do |user|
  json.extract! user, :id, :email, :first_name, :last_name, :phone, :region_id, :is_active, :is_blocked
  json.url user_url(user, format: :json)
end
