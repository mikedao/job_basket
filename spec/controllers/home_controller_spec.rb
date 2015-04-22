require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe "the landing page" do
    before do
      visit "/"
    end

    it "visits the landing page" do
      expect(response.status).to eq(200)
    end
  end
end
