json.array!(@user_data) do |user_datum|
  json.extract! user_datum, :id, :name, :contact, :email, :description, :is_activated
  json.url user_datum_url(user_datum, format: :json)
end
