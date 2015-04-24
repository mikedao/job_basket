class JobsController < ApplicationController
  before_action :authorize!
  def index
  end

  def show
    @job = Job.find(params[:id])
    @job_description = @job.description.gsub("]" , "").gsub("[" , "").gsub("\"" , "").gsub("," , "")
    # @b = @a.gsub "[" , ""
    # @c = @b.gsub "\"" , ""
    # @job_description = @c.gsub "," , ""

  end
end
