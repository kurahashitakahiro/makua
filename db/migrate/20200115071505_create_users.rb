class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_image_id
      t.string :name
      t.string :mail_address
      t.string :password
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
