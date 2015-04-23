Rails.application.routes.draw do
<<<<<<< HEAD
  
=======
  root "home#index"
  resources :jobs
  get "/auth/github/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

<<<<<<< HEAD
  get "/jobs", to: "jobs#index"
>>>>>>> ed69e7886ca3723676a14045477b201887d448c2
=======
  namespace :api do
    namespace :v1 do
      post "/jobs", to: "jobs#create"
    end
  end
>>>>>>> 7a93d9a1a23ddcfd6c620c4bb46207c3bdee7ffe
end
