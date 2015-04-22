Rails.application.routes.draw do
  root to: "jobs#index"
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  resources :jobs, only: [:index]
  get "home", to: "home#index"
end
