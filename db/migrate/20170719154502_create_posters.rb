class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.string :title
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
