class RenameBookIdColumnToViewCounts < ActiveRecord::Migration[6.1]
  def change
    rename_column :view_counts, :book_id, :post_id
  end
end
