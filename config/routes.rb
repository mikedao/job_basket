Rails.application.routes.draw do
  root 'home#index'
  resources :jobs
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
