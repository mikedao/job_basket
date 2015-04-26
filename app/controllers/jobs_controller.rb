class JobsController < ApplicationController
  before_action :authorize!

  def index
    #@jobs = Job.order(posting_date: :desc).includes(:company)
    @jobs = Job.joins(:hiddenjobs).where.not(id: current_user.hiddenjobs.pluck(:id))
  end

  def show
    @job = Job.find(params[:id])
    @job_description =
      @job.description.gsub("]", "").gsub("[", "").gsub("\"", "").gsub(",", "")
  end
end
