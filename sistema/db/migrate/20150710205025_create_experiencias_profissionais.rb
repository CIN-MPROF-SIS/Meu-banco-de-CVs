class CreateExperienciasProfissionais < ActiveRecord::Migration
  def change
    create_table :experiencias_profissionais do |t|
      t.string :empresa, null:false
      t.string :areaAtuacao, null:false
      t.date :dataInicio, null:false
      t.date :dataConclusao
      t.references :candidato, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
  end
end
