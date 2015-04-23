require 'rails_helper'

RSpec.describe "ShowPages", type: :request do
  describe "GET /show_pages" do
    before do
      @user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "has a single job with associated info" do
      puts job = create(:job)
      visit job_path(job)
      expect(page).to have_content(job.position)
      #expect(page).to have_content("Wed, 22 Apr 2015")
      expect(page).to have_content(job.description)
      expect(page).to have_content(job.location)
    end
  end
end
