class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.integer :group_id
      t.integer :user_id
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
