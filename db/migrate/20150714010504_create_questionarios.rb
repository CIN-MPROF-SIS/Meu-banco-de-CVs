class CreateQuestionarios < ActiveRecord::Migration
  def change
    create_table :questionarios do |t|
      t.string :descricao, null:false
      t.references :vaga, index: true, foreign_key: true, null:false

      t.timestamps null: false
    end
  end
end
