json.array!(@municipios) do |municipio|
  json.extract! municipio, :id, :nome, :unidade_federativa_id
  json.url municipio_url(municipio, format: :json)
end
