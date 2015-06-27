class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.string :nome
      t.references :unidade_federativa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
