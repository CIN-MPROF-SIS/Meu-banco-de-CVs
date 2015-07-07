class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
        t.string :login
      	t.string :password_digest
      	t.boolean :status
      	t.string :papel 
        t.timestamps null: false
    end
  end
end
