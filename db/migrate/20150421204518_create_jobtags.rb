class CreateJobtags < ActiveRecord::Migration
  def change
    create_table :jobtags do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
