require "rails_helper"

RSpec.describe Job, type: :model do
  describe "validations" do
    it { should belong_to(:company) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:source) }
  end

  describe "posting_date default" do
    it "accepts a date if provided" do
      date = 5.days.ago
      job = create(:job, posting_date: date)
      expect(job.posting_date.to_s).to eq(date.strftime("%F"))
    end

    it "uses today's date if not provided" do
      job = create(:job, posting_date: nil)
      expect(job.posting_date.to_s).to eq(Date.today.strftime("%F"))
    end
  end
end
