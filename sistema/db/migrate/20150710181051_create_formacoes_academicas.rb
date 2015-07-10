class CreateFormacoesAcademicas < ActiveRecord::Migration
  def change
    create_table :formacoes_academicas do |t|
      t.string :instituicao, null:false
      t.float :cargaHoraria, null:false
      t.date :dataInicio, null:false
      t.date :dataConclusao
      t.references :pessoa_fisica, index: true, foreign_key: true, null:false
      t.references :grau_formacao, index: true, foreign_key: true, null:false
      
      t.timestamps null: false
    end
  end
end
