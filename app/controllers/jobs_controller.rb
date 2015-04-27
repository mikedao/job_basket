class JobsController < ApplicationController
  before_action :authorize!

  def index
    if current_user && params[:my_jobs]
      @jobs = Job.find(current_user.likedjobs.pluck(:job_id))
    else
      @jobs = Job.where.not(id: current_user.jobshidden.pluck(:id))
        .order(posting_date: :desc).includes(:company)
    end
  end

  def show
    @job = Job.find(params[:id])
    @job_description =
      @job.description.gsub("]", "").gsub("[", "").gsub("\"", "").gsub(",", "")
  end
end
