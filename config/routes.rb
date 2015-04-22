Rails.application.routes.draw do
  namespace :api do
    post "/jobs", to: "jobs#create"
  end
end
