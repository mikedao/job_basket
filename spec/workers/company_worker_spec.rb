require "rails_helper"

RSpec.describe CompanyWorker do
  it "populates company data" do
    company = Company.create(name: "Twitter")
    worker = CompanyWorker.new

    worker.perform(company.name, 5)

    expect(Company.find(company.id).ceo_name.class).to eq(String)
  end
end
