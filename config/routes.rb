Rails.application.routes.draw do
  namespace :api do
    post "/jobs", to: "jobs#create"
  end

  root "home#index"

  get "/jobs", to: "jobs#index"
end
