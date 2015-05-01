require "rails_helper"

RSpec.describe "ShowPages", type: :request do
  describe "GET /show_pages" do
    before do
      @user = create(:user)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(@user)
    end

    it "has a single job with associated info" do
      job = create(:job)
      visit job_path(job)
      expect(page).to have_content(job.position)
      save_and_open_page
      expect(page).to have_content(Date.today.strftime("%b %d, %Y"))
      expect(page).to have_content(job.description)
      expect(page).to have_content(job.location)
    end
  end
end
