class RenameUserjobsToLikedJobs < ActiveRecord::Migration
  def change
    rename_table :userjobs, :likedjobs
  end
end
