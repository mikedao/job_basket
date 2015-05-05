class MyJobsController < ApplicationController
  before_action :authorize!

  def index
    @jobs = current_user.jobs_liked.includes(:company)
    @tags = current_user.jobs_liked.flat_map { |j| j.tags.map(&:name) }.uniq
  end
end
