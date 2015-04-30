class MyJobsController < ApplicationController
  def index
    @jobs = current_user.jobsliked.includes(:company)
    @tags = Tag.pluck(:name)
  end
end
