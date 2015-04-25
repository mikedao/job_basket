require 'rails_helper'

RSpec.describe LikedJobsController, type: :controller do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(@user)
  end

  describe "#create" do
    it "associates a user and a job" do
      @job = Job.create(position: "web dev", source: "glassdoor", description: "some cool job")
      post :create, id: @job.id

      expect(@user.jobsliked.first).to eq(@job)
    end
  end
end
