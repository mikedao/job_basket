class AddRelevantToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :relevant, :boolean, default: false
  end
end
