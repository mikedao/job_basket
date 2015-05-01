class JobsController < ApplicationController
  before_action :authorize!

  def index
    @jobs = Job.visible_for(current_user).includes(:company)
  end

  def show
    @job = Job.find(params[:id])
    @job_description =
      @job.description.gsub("]", "").gsub("[", "").gsub("\"", "").gsub(",", "")
  end

  def update

  end
end
