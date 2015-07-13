json.array!(@graus_formacao) do |grau_formacao|
  json.extract! grau_formacao, :id, :descricao
  json.url grau_formacao_url(grau_formacao, format: :json)
end
