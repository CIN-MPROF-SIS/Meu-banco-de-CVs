json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :login, :senha, :ativo
  json.url usuario_url(usuario, format: :json)
end
