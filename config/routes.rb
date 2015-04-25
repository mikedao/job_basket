Rails.application.routes.draw do
  root "home#index"
  resources :jobs
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  namespace :api do
    namespace :v1 do
      post "/jobs", to: "jobs#create"
      resources :jobs, only: [:show, :index]
    end
  end
end
