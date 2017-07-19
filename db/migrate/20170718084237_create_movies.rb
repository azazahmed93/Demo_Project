class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :plot
      t.string :year
      t.string :genre
      t.string :time
      t.string :url
      t.string :rating

      t.timestamps null: false
    end
  end
end
