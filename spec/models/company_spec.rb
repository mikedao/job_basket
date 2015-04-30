require "rails_helper"

RSpec.describe Company, type: :model do
  describe "validations" do
    it "should validate presence of name" do
      company = build(:company)
      company2 = build(:company, name: nil)

      expect(company).to be_valid
      expect(company2).not_to be_valid
    end

    it "can have a job" do
      company = create(:company)
      company.jobs << create(:job)

      expect(company.jobs.count).to eq(1)
    end

    it "can have many jobs" do
      company = create(:company)
      company.jobs << create(:job, position: "job1")
      company.jobs << create(:job, position: "job2")

      expect(company.jobs.count).to eq(2)
    end
  end

  it "populates company data on create" do
    company = Company.create(name: "Twitter")

    expect(company.ceo_name.class).to eq(String)
  end
end
