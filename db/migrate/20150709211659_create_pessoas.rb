class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome, null:false
      t.string :email, null:false
      t.string :telefone, null:false
      t.string :logradouro, null:false
      t.string :complemento
      t.string :numero, null:false
      t.string :bairro, null:false
      t.references :municipio, index: true, foreign_key: true, null:false
      t.string :cep, null:false
      
      
      
      #Tipo
      t.string :type
      
      #Candidato
      t.string :cpf, unique:true
      t.date :dataNascimento
	    t.references :naturalidade, index: true, foreign_key: true 
	    t.string :nacionalidade
	    t.string :foto
	    t.string :curriculo
	    
	    #Contratante
	     t.string :inscricaoEstadual
       t.string :cnpj, null:true
       t.string :logo
 
	   
    end
    
  end
end
