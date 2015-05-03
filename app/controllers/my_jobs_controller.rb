class MyJobsController < ApplicationController
  def index
    @jobs = current_user.jobs_liked.includes(:company)
    @tags = current_user.jobs_liked.map
      { |job| job.tags.map(&:name) }.flatten.uniq
  end
end
