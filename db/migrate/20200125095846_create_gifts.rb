class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.integer :user_id
      t.string :item_name
      t.string :title
      t.text :body
      t.integer :status
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
