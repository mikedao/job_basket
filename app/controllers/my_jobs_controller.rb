class MyJobsController < ApplicationController
  def index
    @jobs = current_user.jobs_liked.includes(:company)
  end
end
