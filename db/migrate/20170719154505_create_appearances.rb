class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.string :role
      t.references :movie, index: true, foreign_key: true
      t.references :actor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
