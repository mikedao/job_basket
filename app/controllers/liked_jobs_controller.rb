class LikedJobsController < ApplicationController
  def create
    @job = Job.find(params[:id])
    @likedjob = Likedjob.create(user_id: current_user.id,
                                           job_id: @job.id)
    if @likedjob.save
      render json: @likedjob
    end
  end
end
