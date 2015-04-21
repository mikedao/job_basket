require 'rails_helper'

RSpec.describe "LandingPages", type: :request do
  describe "GET /landing_pages" do
    before do
      visit '/'
    end

    it "has job basket on the landing page" do
      expect(page).to have_content('Job Basket')
    end
  end
end
