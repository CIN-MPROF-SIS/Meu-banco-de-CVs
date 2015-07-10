class CreateCandidatoLinguas < ActiveRecord::Migration
  def change
    create_table :candidato_linguas do |t|
      t.references :pessoa_fisica, index: true, foreign_key: true, null:false
      t.references :nivel, index: true, foreign_key: true, null:false
      t.references :lingua, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
    
    add_index :candidato_linguas, [:pessoa_fisica_id, :nivel_id, :lingua_id], :unique => true, :name => "idx_candidato_lingua"
  end
end
