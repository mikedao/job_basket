class MyJobsController < ApplicationController
  def index
    @jobs = current_user.jobs_liked.includes(:company)
    @tags = Tag.pluck(:name)
  end
end
