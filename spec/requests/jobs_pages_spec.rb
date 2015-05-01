require "rails_helper"

RSpec.describe "JobsPages", type: :request do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(@user)
  end

  describe "GET /jobs" do
    it "shows liked jobs" do
      job = create(:job)
      @tags = create(:tag)
      @user.jobs_liked << job

      visit jobs_path

      expect(page).to have_content(job.position)
      expect(page).to have_content(job.location)
      expect(page).to have_content("Added to My Jobs")
    end

    it "doesn't show hidden jobs" do
      hidden_job = create(:job, position: "Hiding job")
      @user.jobs_hidden << hidden_job

      visit jobs_path

      expect(page).not_to have_content("Hiding job")
    end
  end

  describe "GET /job/:id" do
    it "has a single job with associated info" do
      job = create(:job)

      visit job_path(job)

      expect(page).to have_content(job.position)
      expect(page).to have_content(job.posting_date.strftime("%B %e, %Y"))
      expect(page).to have_content(job.description)
      expect(page).to have_content(job.location)
    end
  end
end
