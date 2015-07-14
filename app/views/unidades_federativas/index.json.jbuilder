json.array!(@unidades_federativas) do |unidade_federativa|
  json.extract! unidade_federativa, :id, :sigla, :nome
  json.url unidade_federativa_url(unidade_federativa, format: :json)
end
