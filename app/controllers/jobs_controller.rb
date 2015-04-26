class JobsController < ApplicationController
  before_action :authorize!

  def index
    if params[:my_jobs]
      @jobs = current_user.likedjobs
    else
      @jobs = Job.order(posting_date: :desc).includes(:company)
    end
  end

  def show
    @job = Job.find(params[:id])
    @job_description =
      @job.description.gsub("]", "").gsub("[", "").gsub("\"", "").gsub(",", "")
  end
end
