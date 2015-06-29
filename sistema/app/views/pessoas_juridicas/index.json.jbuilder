json.array!(@pessoas_juridicas) do |pessoa_juridica|
  json.extract! pessoa_juridica, :id, :nome, :email, :telefone, :logradouro, :complemento, :numero, :cep, :municipio_id, :inscricaoEstagual, :cnpj, :logo, :autorizado
  json.url pessoa_juridica_url(pessoa_juridica, format: :json)
end
