class CreateFaixasSalariais < ActiveRecord::Migration
  def change
    create_table :faixas_salariais do |t|
      t.string :valor

      t.timestamps null: false
    end
  end
end
