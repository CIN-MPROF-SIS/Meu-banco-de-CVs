class CreateNiveis < ActiveRecord::Migration
  def change
    create_table :niveis do |t|
      t.string :descricao, null:false
      t.timestamps null: false
    end
  end
end
