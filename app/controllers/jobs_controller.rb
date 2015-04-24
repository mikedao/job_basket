class JobsController < ApplicationController
  before_action :authorize!
  def index
  end

  def show
    @job = Job.find(params[:id])
    @job_description = @job.description
      .gsub("]", "")
      .gsub("[", "")
      .gsub("\"", "")
      .gsub(",", "")
  end
end
