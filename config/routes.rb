Rails.application.routes.draw do
  root to: "jobs#index"

  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "home", to: "home#index"

  resources :jobs, only: [:index]

  namespace :api do
    post "/jobs", to: "jobs#create"
  end
end
