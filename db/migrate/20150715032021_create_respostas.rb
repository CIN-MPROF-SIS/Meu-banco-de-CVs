class CreateRespostas < ActiveRecord::Migration
  def change
    create_table :respostas do |t|
      t.references :opcao, index: true, foreign_key: true, null:false
      t.references :candidato, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
  end
end
