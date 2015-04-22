class Api::JobsController < ApplicationController
  def create
    job = Job.where(job_params).first_or_initialize
    if !job.new_record?
      render json: job, status: :found
    elsif job.new_record? && job.save
      render json: job, status: :created
    else
      render json: job.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).
      permit(:position, :description, :posting_date, :source, :location)
  end
end
