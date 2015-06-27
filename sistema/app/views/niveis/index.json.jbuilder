json.array!(@niveis) do |nivel|
  json.extract! nivel, :id, :descricao
  json.url nivel_url(nivel, format: :json)
end
