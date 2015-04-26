class Api::V1::JobsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    job = Job.where(job_params).first_or_initialize

    if !job.new_record?
      render json: job, status: :found
    elsif job.new_record? && job.save
      associate_with_company(job)
      associate_with_tags(job)
      render json: job, status: :created
    else
      render json: job.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    job = Job.find(params[:id])

    render json: job, serializer: JobSerializer
  end

  def index
    jobs = Job.all

    render json: jobs, each_serializer: JobSerializer
  end

  private

  def job_params
    params.require(:job).permit(:position, :description, :posting_date,
                                :source, :location)
  end

  def associate_with_company(job)
    name = params[:job]["company"] || "unknowncompany"
    company = Company.find_or_create_by(name: name)
    company.jobs << job
  end

  def associate_with_tags(job)
    tags_list = params[:job]["tags"]
    tags = []
    if tags_list.present?
      tags = tags_list.map { |tag| Tag.find_or_create_by(name: tag) }
    end
    job.tags = tags
  end
end
