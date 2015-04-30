class MyJobsController < ApplicationController
  def index
    @jobs = current_user.jobsliked.includes(:company)
  end
end
