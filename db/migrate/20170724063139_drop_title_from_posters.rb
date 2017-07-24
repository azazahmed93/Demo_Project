class DropTitleFromPosters < ActiveRecord::Migration
  def change
    remove_column :posters, :title
  end
end
