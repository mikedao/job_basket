require "rails_helper"

RSpec.describe Api::V1::CompaniesController, type: :controller do
  describe "#GET show" do
    let(:company) { create(:company) }

    it "#GET api/v1/company/:id" do
      get :show, id: company.id
      result = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(result["company"]["id"]).to eq(company.id)
      expect(result["company"]["name"]).to eq("Twitter")
    end
  end
end
