class CreateLinguas < ActiveRecord::Migration
  def change
    create_table :linguas do |t|
      t.string :descricao
      
      t.timestamps null: false
    end
  end
end
