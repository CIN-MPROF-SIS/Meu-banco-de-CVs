json.array!(@pessoas_fisicas) do |pessoa_fisica|
  json.extract! pessoa_fisica, :id, :nome, :email, :telefone, :logradouro, :complemento, :numero, :cep, :cidade_id, :dataNascimento, :naturalidade_id, :nacionalidade, :cpf, :foto
  json.url pessoa_fisica_url(pessoa_fisica, format: :json)
end
