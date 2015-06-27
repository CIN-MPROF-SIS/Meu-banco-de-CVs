class CreateGrausFormacao < ActiveRecord::Migration
  def change
    create_table :graus_formacao do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
