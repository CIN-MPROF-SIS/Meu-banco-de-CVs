json.array!(@moderadores) do |moderador|
  json.extract! moderador, :id, :nome, :email, :telefone, :logradouro, :complemento, :numero, :cep, :cidade_id
  json.url moderador_url(moderador, format: :json)
end
