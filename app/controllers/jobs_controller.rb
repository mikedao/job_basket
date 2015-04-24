class JobsController < ApplicationController
  before_action :authorize!
  def index
  end

  def show
    @job = Job.find(params[:id])
    @a = @job.description.gsub "]" , ""
    @b = @a.gsub "[" , ""
    @c = @b.gsub "\"" , ""
    @job_description = @c.gsub "," , ""

  end
end
