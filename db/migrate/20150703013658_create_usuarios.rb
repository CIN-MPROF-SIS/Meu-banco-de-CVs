class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
        t.string :login, null:false
      	t.string :password_digest ,null:false
      	t.boolean :status, default: true
      	t.string :papel , null:false
        t.references :pessoa, index: true, foreign_key: true, null:true
    end
  end
end
