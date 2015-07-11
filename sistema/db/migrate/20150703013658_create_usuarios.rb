class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
        t.string :login
      	t.string :password_digest
      	t.boolean :status
      	t.string :papel 
        t.references :pessoa, index: true, foreign_key: true, null:true
    end
  end
end
