class CreateVagas < ActiveRecord::Migration
  def change
    create_table :vagas do |t|
      t.references :contratante , index: true, foreign_key: true, null:false
      t.references :faixa_salarial, index: true, foreign_key: true, null:false
      t.references :cidade , index: true, foreign_key: true, null:false
      t.string :quantidade
      t.string :cargo
      t.string :descricao
      t.date :data_cadastro
      t.date :data_inicio_inscricao
      t.date :data_termino_inscricao

      t.timestamps null: false
    end
  end
end
