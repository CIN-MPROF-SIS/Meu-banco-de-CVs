json.array!(@vagas) do |vaga|
  json.extract! vaga, :id, :contratante_id, :faixas_salariais_id, :cidade_id, :quantidade, :cargo, :descricao, :data_cadastro, :data_inicio_inscricao, :data_termino_inscricao
  json.url vaga_url(vaga, format: :json)
end
