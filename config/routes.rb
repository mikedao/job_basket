Rails.application.routes.draw do
  root "jobs#index"
  get "/home", to: "home#index"
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :jobs, only: [:index]
end
