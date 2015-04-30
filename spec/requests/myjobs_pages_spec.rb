require "rails_helper"

RSpec.describe "MyjobsPages", type: :request do
  describe "GET /myjobs_pages" do
    before do
      @user = create(:user)
      allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(@user)
    end

    it "has liked jobs" do
      job = create(:job)
      @tags = create(:tag)
      hidden_job = create(:job)
      @user.jobsliked << job
      @user.jobshidden << hidden_job
      visit my_jobs_path

      expect(page).to have_content(job.position)
      expect(page).to have_content(job.location)
      expect(page).to have_content("Added to My Jobs")
    end
  end
end
