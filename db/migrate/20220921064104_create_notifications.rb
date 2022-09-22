class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|

      t.timestamps
      t.integer :visiter_id
      t.integer :visited_id
      t.integer :post_id
      t.integer :comment_id
      t.string :action
      t.boolean :check, null: false, default: false
    end
  end
end
