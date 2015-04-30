class MyJobsController < ApplicationController
  def index
    @jobs = current_user.jobsliked.order(posting_date: :desc).includes(:company)
  end
end
