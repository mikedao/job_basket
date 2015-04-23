class JobsController < ApplicationController
  before_action :authorize!
  def index
  end

  def show
    @job = Job.find(params[:id])
  end
end
