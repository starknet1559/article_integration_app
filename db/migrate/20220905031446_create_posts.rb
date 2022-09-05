class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :genre_id, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.text :content_url, null: false
      t.timestamps
    end
  end
end
