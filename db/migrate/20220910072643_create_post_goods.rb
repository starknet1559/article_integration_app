class CreatePostGoods < ActiveRecord::Migration[6.1]
  def change
    create_table :post_goods do |t|
      t.integer :post_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
