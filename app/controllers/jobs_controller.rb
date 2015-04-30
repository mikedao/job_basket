class JobsController < ApplicationController
  before_action :authorize!

  def index
    @jobs = Job.where.not(id: current_user.jobshidden.pluck(:id))
    .order(posting_date: :desc).includes(:company)
  end

  def show
    @job = Job.find(params[:id])
    @job_description =
      @job.description.gsub("]", "").gsub("[", "").gsub("\"", "").gsub(",", "")
  end
end
