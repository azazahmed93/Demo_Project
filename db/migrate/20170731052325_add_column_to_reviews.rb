class AddColumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :report_count, :integer
  end
end
