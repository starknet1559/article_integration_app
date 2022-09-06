class AddColumnGenrePost < ActiveRecord::Migration[6.1]
  def change
    add_column :genre_posts, :genre_id, :integer, null: false, foreign_key: true
    add_column :genre_posts, :post_id, :integer, null: false, foreign_key: true
  end

end
