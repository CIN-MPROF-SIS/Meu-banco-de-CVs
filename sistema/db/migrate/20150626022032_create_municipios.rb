class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.string :nome, null:false
      t.references :unidade_federativa, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
  end
end
