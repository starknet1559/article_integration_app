class ChangeCloumnsNotnullAddPosts < ActiveRecord::Migration[6.1]

  def up
    change_column_null :posts, :content_url, false
  end

  def down
    change_column_null :posts, :content_url, true
  end
end