class CreatePessoasFisicas < ActiveRecord::Migration
  def change
    create_table :pessoas_fisicas, :inherits => :pessoa do |t|
      t.date :dataNascimento, :null => false
      t.references :naturalidade, references: :cidade_id, index: true, foreign_key: true, :null => false
      t.string :nacionalidade, :null => false
      t.string :cpf, :null => false
      t.string :foto

      t.timestamps null: false
    end
  end
end
