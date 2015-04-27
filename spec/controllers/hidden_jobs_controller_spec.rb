require "rails_helper"

RSpec.describe HiddenJobsController, type: :controller do
  before do
    @user = create(:user)
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(@user)
  end

  describe "#create" do
    it "adds hidden job to user" do
      @job = create(:job)
      post :create, id: @job.id

      expect(@user.jobshidden.first).to eq(@job)
    end
  end
end
