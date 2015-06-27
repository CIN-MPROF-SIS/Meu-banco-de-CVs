class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :subtype, :null => false
      t.string :nome, :null => false
      t.string :email, :null => false
      t.string :telefone, :null => false
      t.string :logradouro, :null => false
      t.string :complemento
      t.string :numero
      t.string :cep, :null => false
      t.references :cidade, index: true, foreign_key: true, :null => false

      t.timestamps null: false
    end
  end
end
