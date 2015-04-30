Rails.application.routes.draw do
  root "home#index"
  resources :jobs
  resources :liked_jobs, only: [:create]
  resources :hidden_jobs, only: [:create]
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  namespace :api do
    namespace :v1 do
      post "/jobs", to: "jobs#create"
      resources :jobs, only: [:show, :index]
      resources :companies, only: [:show, :index]
      resources :tags, only: [:index]
    end
  end
end
