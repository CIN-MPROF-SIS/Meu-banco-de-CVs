class CreateQuestoes < ActiveRecord::Migration
  def change
    create_table :questoes do |t|
      t.string :descricao, null:false
      t.float :nota, null:false
      t.references :questionario, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
  end
end
