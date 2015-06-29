class CreatePessoasJuridicas < ActiveRecord::Migration
  def change
    create_table :pessoas_juridicas do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.string :logradouro
      t.string :complemento
      t.string :numero
      t.string :cep
      t.string :bairro
      t.references :municipio, index: true, foreign_key: true
      t.string :inscricaoEstadual
      t.string :cnpj
      t.string :logo
      t.boolean :autorizado

      t.timestamps null: false
    end
  end
end
