class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :user_id
      t.string :place
      t.string :time
      t.text :content

      t.timestamps
    end
  end
end
