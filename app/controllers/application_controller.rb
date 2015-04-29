class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def disable_nav
    @disable_nav = true
  end

  def queued_jobs
    @queued_jobs ||= Job.where(approved: false).count
  end
  helper_method :queued_jobs

  def authorize!
    redirect_to root_path unless current_user
  end
end
