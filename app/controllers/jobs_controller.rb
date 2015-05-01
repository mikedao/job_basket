class JobsController < ApplicationController
  before_action :authorize!

  def index
    @jobs = Job.visible_for(current_user).includes(:company)
    @tags = Tag.pluck(:name)
  end

  def show
    @job = Job.find(params[:id])
  end
end
