require "rails_helper"

RSpec.describe "QueuedJobs", type: :request do
  let!(:user) do
    create(:user)
  end

  before do
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
  end

  it "user can click link to visit queued jobs" do
    visit jobs_path
    click_link "queue"
    expect(current_path).to eq(queued_jobs_path)
  end

  it "user can view queued jobs" do
    @queued_job = create(:job, position: "Rails Dev", approved: false)
    @approved_job = create(:job, position: "Janitor", approved: true)
    visit queued_jobs_path
    expect(page).to have_content(@queued_job.position)
    expect(page).to_not have_content(@approved_job.position)
  end

  it "user can review queued job" do
    @queued_job = create(:job, position: "Rails Dev", approved: false)
    visit queued_jobs_path
    click_button "Review"
    expect(current_path).to eq(edit_queued_job_path(@queued_job))
  end
end
