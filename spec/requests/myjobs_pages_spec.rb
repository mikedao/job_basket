require "rails_helper"

RSpec.describe "MyjobsPages", type: :request do
  describe "GET /myjobs" do
    before do
      @user = create(:user)
      allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(@user)
    end

    it "has only liked jobs" do
      job = create(:job)
      @user.jobsliked << job

      visit my_jobs_path

      expect(page).to have_content(job.position)
      expect(page).to have_content(job.location)
      expect(page).to have_content("Added to My Jobs")
    end

    it "does not show hidden jobs" do
      hidden_job = create(:job, position: "Hidden job", location: "nowhere")
      @user.jobshidden << hidden_job

      visit my_jobs_path

      expect(page).to_not have_content("Hidden job")
      expect(page).to_not have_content("nowhere")
    end

    it "does not show jobs not yet liked" do
      create(:job, position: "Not liked yet")

      visit my_jobs_path

      expect(page).to_not have_content("Not liked yet")
    end
  end
end
