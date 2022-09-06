class CreateGenrePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :genre_posts do |t|

      t.timestamps
    end
  end
end
