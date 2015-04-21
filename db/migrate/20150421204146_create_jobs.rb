class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :position
      t.date :posting_date
      t.text :description
      t.string :location
      t.references :company

      t.timestamps null: false
    end
  end
end
