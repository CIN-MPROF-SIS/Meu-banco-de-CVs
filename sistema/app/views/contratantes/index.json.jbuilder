json.array!(@contratantes) do |contratante|
  json.extract! contratante, :id, :nome, :email, :telefone, :logradouro, :complemento, :numero, :bairro, :cep, :municipio_id, :inscricaoEstadual, :cnpj, :logo, :autorizado
  json.url contratante_url(contratante, format: :json)
end
