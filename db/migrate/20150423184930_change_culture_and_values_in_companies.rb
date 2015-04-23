class ChangeCultureAndValuesInCompanies < ActiveRecord::Migration
  def change
    rename_column :companies, :cultureandvaluesi_rating, :cultureandvalues_rating
  end
end
