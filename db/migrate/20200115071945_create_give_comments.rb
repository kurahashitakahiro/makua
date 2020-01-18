class CreateGiveComments < ActiveRecord::Migration[5.2]
  def change
    create_table :give_comments do |t|
      t.integer :give_id
      t.integer :user_id
      t.text :comment
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
