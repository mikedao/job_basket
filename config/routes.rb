Rails.application.routes.draw do
  root "home#index"

  get "/jobs", to: "jobs#index"
end
