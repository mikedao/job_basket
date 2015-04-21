class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :token
      t.string :uid
      t.string :profile_image_url

      t.timestamps null: false
    end
  end
end
