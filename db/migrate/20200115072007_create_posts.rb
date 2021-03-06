class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :post_image
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
