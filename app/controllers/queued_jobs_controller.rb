class QueuedJobsController < ApplicationController
  def index
    @jobs = Job.where(approved: false)
  end

  def edit
    @job = Job.find(params[:id])
  end
end
