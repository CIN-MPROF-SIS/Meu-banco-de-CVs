class CreateModeradores < ActiveRecord::Migration
  def change
    create_table :moderadores, :inherits => :pessoaFisica  do |t|

      t.timestamps null: false
    end
  end
end
