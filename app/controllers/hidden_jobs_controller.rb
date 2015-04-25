class HiddenJobsController < ApplicationController
  def create
    @job = Job.find(params[:id])
    @hiddenjob = Hiddenjob.create(user_id: current_user.id,
                                  job_id: @job.id)
    if @hiddenjob.save
      render json: @hiddenjob
    end
  end
end
