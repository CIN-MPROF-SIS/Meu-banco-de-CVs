class CreateCertificados < ActiveRecord::Migration
  def change
    create_table :certificados do |t|
      t.string :descricao, null:false
      t.references :pessoa_fisica, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
  end
end
