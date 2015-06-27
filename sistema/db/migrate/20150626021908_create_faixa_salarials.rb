class CreateFaixaSalarials < ActiveRecord::Migration
  def change
    create_table :faixa_salarials do |t|
      t.string :valor

      t.timestamps null: false
    end
  end
end
