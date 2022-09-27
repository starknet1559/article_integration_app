class ChangeDataBiographyToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :biography, :text
  end
end
