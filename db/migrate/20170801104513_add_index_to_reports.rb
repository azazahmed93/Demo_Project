class AddIndexToReports < ActiveRecord::Migration
  def change
    add_index :reports, [:review_id, :user_id], unique: true
  end
end
