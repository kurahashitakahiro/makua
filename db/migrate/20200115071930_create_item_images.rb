class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.integer :give_id
      t.string :item_image_id
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
