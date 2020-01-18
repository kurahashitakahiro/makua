class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :room_id
      t.integer :sender_id
      t.text :body
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
