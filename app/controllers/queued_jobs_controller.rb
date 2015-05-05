class QueuedJobsController < ApplicationController
  before_action :authorize!

  def index
    @jobs = Job.where(approved: false)
    @tags = @jobs.flat_map { |job| job.tags.pluck(:name) }.uniq
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    job = Job.find(params[:id])
    job.update(queue_params)
    redirect_to queued_jobs_path
  end

  private

  def queue_params
    params.require(:job).permit(:position, :description, :location, :approved)
  end
end
