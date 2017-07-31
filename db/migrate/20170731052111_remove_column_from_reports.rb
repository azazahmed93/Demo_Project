class RemoveColumnFromReports < ActiveRecord::Migration
  def change
    remove_column :reports, :count, :string
  end
end
