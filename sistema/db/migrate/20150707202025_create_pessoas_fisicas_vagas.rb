class CreatePessoasFisicasVagas < ActiveRecord::Migration
  def change
    create_table :pessoas_fisicas_vagas do |t|
      t.references :pessoa_fisica, index: true, foreign_key: true, null:false
      t.references :vaga, index: true, foreign_key: true, null:false
    end
    
    add_index :pessoas_fisicas_vagas, [:pessoa_fisica_id, :vaga_id], :unique => true
  end
  
end
