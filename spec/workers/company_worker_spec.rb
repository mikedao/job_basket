require "rails_helper"

RSpec.describe CompanyWorker do
  it "populates company data" do
    VCR.use_cassette("company_worker", record: :new_episodes) do
      company = Company.create(name: "Twitter")
      worker = CompanyWorker.new

      worker.perform(company.name, 5)

      expect(Company.find(company.id).ceo_name.class).to eq(String)
    end
  end
end
