class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, index: true
      t.string :password_digest
      t.string :role
      t.string :name

      t.timestamps null: false
    end
  end
end
