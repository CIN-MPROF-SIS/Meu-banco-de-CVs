class CreatePessoasJuridicas < ActiveRecord::Migration
  def change
    create_table :pessoas_juridicas do |t|
      t.string :nome, null:false
      t.string :email, null:false
      t.string :telefone, null:false
      t.string :logradouro, null:false
      t.string :complemento
      t.string :numero, null:false
      t.string :cep, null:false
      t.string :bairro, null:false
      t.references :municipio, index: true, foreign_key: true, null:false
      t.string :inscricaoEstadual, null:false
      t.string :cnpj, null:false
      t.string :logo
      t.boolean :autorizado, null:false

      t.timestamps null: false
    end
  end
end
