class QueuedJobsController < ApplicationController
  def index
    @jobs = Job.where(approved: false)
    @tags = @jobs.flat_map { |job| job.tags.pluck(:name) }.uniq
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    job.update(
      approved: true,
      position: params[:job][:position],
      description: params[:job][:description],
      location: params[:job][:location])
    redirect_to queued_jobs_path
  end
end
