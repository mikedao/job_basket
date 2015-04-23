class AddColumnsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :industry, :string
    add_column :companies, :logo_url, :string
    add_column :companies, :overall_rating, :float
    add_column :companies, :rating_description, :string
    add_column :companies, :cultureandvaluesi_rating, :float
    add_column :companies, :seniorleadership_rating, :float
    add_column :companies, :compensationandbenefits_rating, :float
    add_column :companies, :careeropportunities_rating, :float
    add_column :companies, :worklifebalance_rating, :float
    add_column :companies, :recommendtofriends_rating, :float
    add_column :companies, :ceo_name, :string
    add_column :companies, :ceo_picture, :string
    add_column :companies, :approval_rating, :integer

  end
end
