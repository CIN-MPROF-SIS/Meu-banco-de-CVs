json.array!(@faixas_salariais) do |faixa_salarial|
  json.extract! faixa_salarial, :id, :valor
  json.url faixa_salarial_url(faixa_salarial, format: :json)
end
