class CreateLinguas < ActiveRecord::Migration
  def change
    create_table :linguas do |t|
      t.string :descricao, null:false
      
      t.timestamps null: false
    end
  end
end
