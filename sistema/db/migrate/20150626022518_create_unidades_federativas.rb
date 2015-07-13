class CreateUnidadesFederativas < ActiveRecord::Migration
  def change
    create_table :unidades_federativas do |t|
      t.string :sigla, null:false
      t.string :nome, null:false

      t.timestamps null: false
    end
  end
end
