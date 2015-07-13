class CreatePessoasFisicas < ActiveRecord::Migration
  def change
    create_table :pessoas_fisicas do |t|
      t.string :cpf, null:false, unique:true
      t.string :nome, null:false
      t.string :email, null:false
      t.string :telefone, null:false
      t.string :logradouro, null:false
      t.string :complemento
      t.string :numero, null:false
      t.string :bairro, null:false
      t.references :municipio, index: true, foreign_key: true, null:false
      t.string :cep, null:false
	    t.date :dataNascimento, null:false
	    t.references :municipio, :naturalidade, index: true, foreign_key: true, null:false
	    t.string :nacionalidade, null:false
	    t.string :foto

      t.timestamps null: false
    end
  end
end
