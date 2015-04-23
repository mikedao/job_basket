require "rails_helper"

RSpec.describe Job, type: :model do
  it "has a position" do
    job = create(:job)

    expect(job.position).to eq("Janitor")
  end

  it "has a description" do
    job = create(:job)

    expect(job.description.class).to eq(String)
  end

  it "has a location" do
    job = create(:job)

    expect(job.description).to eq("Clean stuff")
  end

  it "has an associated company" do
    job = create(:job)

    expect(job.company.name).to eq("Twitter")
  end

  it "is not relevant by default" do
    job = create(:job)

    expect(job.relevant).to be_falsey
  end

  describe "validations" do
    it { should belong_to(:company) }
    it { should have_many(:users) }
    it { should validate_presence_of(:position) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:source) }
    it { should have_many(:tags) }
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
