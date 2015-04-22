require "rails_helper"

RSpec.describe Job, type: :model do
  it "has a position" do
    job = create(:job)

    expect(job.position).to eq("Janitor")
  end

  it "has a posting date" do
    job = create(:job)

    expect(job.posting_date.class).to eq(Date)
  end

  it "has a description" do
    job = create(:job)

    expect(job.description.class).to eq(String)
  end

  it "has a location" do
    job = create(:job)

    expect(job.description).to eq("Clean stuff")
  end

  it "has a location" do
    job = create(:job)

    expect(job.location).to eq("Denver, CO")
  end
end
