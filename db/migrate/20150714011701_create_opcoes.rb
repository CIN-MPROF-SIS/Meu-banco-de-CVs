class CreateOpcoes < ActiveRecord::Migration
  def change
    create_table :opcoes do |t|
      t.string :descricao, null: false
      t.boolean :gabarito, null: false, default: false
      t.references :questao, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
  end
end
