class CreateGiftComments < ActiveRecord::Migration[5.2]
  def change
    create_table :gift_comments do |t|
      t.integer :gift_id
      t.integer :user_id
      t.text :comment
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
