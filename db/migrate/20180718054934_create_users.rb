class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :sex
      t.string :age
      t.text :introduction

      t.timestamps
    end
  end
end
