class CreateContratantes < ActiveRecord::Migration
  def change
    create_table :contratantes do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :logradouro
      t.string :complemento
      t.string :numero
      t.string :bairro
      t.string :cep
      t.references :municipio, index: true, foreign_key: true
      t.string :inscricaoEstadual
      t.string :cnpj
      t.string :logo
      t.boolean :autorizado

      t.timestamps null: false
    end
  end
end
