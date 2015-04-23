class AddUrlToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :url, :string
    add_column :companies, :location, :string
  end
end
