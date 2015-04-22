<<<<<<< HEAD
require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'the landing page' do
    before do
      visit '/'
    end

    it "visits the landing page" do
      expect(response.status).to eq(200)
=======
require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
>>>>>>> master
    end
  end
end
