json.array!(@ages) do |age|
  json.extract! age, :id, :description
  json.url age_url(age, format: :json)
end
