json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :login, :password_digest, :papel
  json.url usuario_url(usuario, format: :json)
end
