json.array!(@linguas) do |lingua|
  json.extract! lingua, :id, :descricao
  json.url lingua_url(lingua, format: :json)
end
