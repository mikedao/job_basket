class MyJobsController < ApplicationController
  def index
    @jobs = current_user.jobsliked
  end
end
