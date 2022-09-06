class CreateGenreLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_likes do |t|
      t.integer :genre_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
