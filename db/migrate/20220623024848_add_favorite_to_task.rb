class AddFavoriteToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :favorite, :boolean
  end
end
