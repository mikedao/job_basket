require "rails_helper"

RSpec.describe Api::V1::TagsController, type: :controller do
  describe "#GET index" do
    it "#GET api/v1/tags" do
      2.times { create(:tag) }

      get :index
      result = JSON.parse(response.body)["tags"]

      expect(response.status).to eq(200)
      expect(result.count).to eq(2)
      expect(result).to have_content("Ruby")
    end
  end
end
