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

    it "appends http to the url" do
      company = create(:company, url: "www.google.com")
      company2 = create(:company, url: nil)

      expect(company.url).to start_with("http://")
      expect(company.url).not_to start_with("www")
      expect(company2.url).to be_nil
    end
  end
end
