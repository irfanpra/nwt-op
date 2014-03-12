json.array!(@user_logins) do |user_login|
  json.extract! user_login, :id, :username, :password
  json.url user_login_url(user_login, format: :json)
end
