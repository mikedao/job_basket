require 'rails_helper'

RSpec.describe "JobsPages", type: :request do
  describe "GET /jobs_pages" do
    before do
      @user = create(:user)
      allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(@user)
      @job = create(:job)
    end

    it "User can like a job" do
      visit jobs_path
     click_button("Like")
     expect(@user.jobsliked.first).to eq(@job)
    end
  end
end
