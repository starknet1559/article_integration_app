class ChangeColumnToNull < ActiveRecord::Migration[6.1]

  def up
    change_column_null :users, :biography, true
  end

  def down
    change_column_null :users, :biography, false
  end
end
