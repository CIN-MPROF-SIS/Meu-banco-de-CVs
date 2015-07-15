class CreateCandidatoVagas < ActiveRecord::Migration
  def change
    create_table :candidatos_vagas do |t|
      t.references :candidato, index: true, foreign_key: true, null:false
      t.references :vaga, index: true, foreign_key: true, null:false
      t.boolean :selecionado , default: false
    end
    
    add_index :candidatos_vagas, [:candidato_id, :vaga_id], :unique => true
  end
end
