class CreatePessoasFisicasVagas < ActiveRecord::Migration
  def change
    create_table :pessoas_fisicas_vagas do |t|
    end
  end
  
   def self.up
    create_table :pessoas_fisicas_vagas, :id => false do |t|
      t.integer :pessoa_fisica_id, :null => false
      t.integer :vaga_id, :null => false
    end

    # Add table index
    add_index :pessoas_fisicas_vagas, [:pessoa_fisica_id, :vaga_id], :unique => true

   end

  def self.down
    remove_index :pessoas_fisicas_vagas, :column => [:pessoa_fisica_id, :vaga_id]
    drop_table :pessoas_fisicas_vagas
  end
  
end
