json.array!(@password_recovery_tokens) do |password_recovery_token|
  json.extract! password_recovery_token, :id, :token
  json.url password_recovery_token_url(password_recovery_token, format: :json)
end
