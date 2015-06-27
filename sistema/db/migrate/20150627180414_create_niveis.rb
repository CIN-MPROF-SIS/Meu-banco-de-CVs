class CreateNiveis < ActiveRecord::Migration
  def change
    create_table :niveis do |t|
      t.string :descricao
      t.timestamps null: false
    end
  end
end
