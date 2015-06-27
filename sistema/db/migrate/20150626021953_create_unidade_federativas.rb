class CreateUnidadeFederativas < ActiveRecord::Migration
  def change
    create_table :unidade_federativas do |t|
      t.string :sigla
      t.string :nome

      t.timestamps null: false
    end
  end
end
