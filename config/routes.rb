Rails.application.routes.draw do
  resources :rooms do
    resources :chats
  end

  get "search", to: "search#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :conversations do
    resources :messages
  end

  get "dash", to: "job_positions#job"

  resources :job_positions

  post "/job_positions/new", to: "job_positions#create"

  patch "/job_positions/:id/edit", to: "job_positions#update"

  get "/job_position/:id", to: "job_positions#destroy", as: "job_position_delete"

  resources :job_fields

  post "/job_fields/new", to: "job_fields#create"

  patch "/job_fields/:id/edit", to: "job_fields#update"

  get "/job_field/:id", to: "job_fields#destroy", as: "job_field_delete"

  get "/job_navigations/:id/edit", to: "job_navigations#edit", as: "edit_job_navigation"

  resources :job_navigations

  get "new_job_navigation", to: "job_navigations#new"

  post "/job_navigations/new", to: "job_navigations#create"

  get "/job_navigations/:id/toggle_is_approved", to: "job_navigations#toggle_is_approved",
                                                 as: "toggle_is_approved"

  get "/job_navigations/:id/destroy", to: "job_navigations#destroy", as: "job_navigation_del"

  get "/job_navigation", to: "job_navigations#show"

  resources :job_navigations, only: %i[index destroy] do   # Index page for only admin to approve or reject reviews
    member do
      patch :toggle_is_approved
    end
  end

  resources :job_navigations, only: %i[show] do
    resources :reviews
  end

  resources :job_navigations, only: %i[show edit] do
    resources :applies
  end

  post "/job_navigation", to: "job_navigations#show"

  resources :job_navigations do
    member do
      post "like", to: "job_navigations#vote"
    end
  end

  resources :users

  post "/users/:id/follow", to: "users#follow", as: "follow"
  post "/users/:id/unfollow", to: "users#unfollow", as: "unfollow"
  post "/users/:id/accept", to: "users#accept", as: "accept"
  post "/users/:id/decline", to: "users#decline", as: "decline"
  post "/users/:id/cancel", to: "users#cancel", as: "cancel"

  get "/user/:id", to: "users#destroy", as: "user_delete"

  get "notify", to: "users#notify"

  get "connection", to: "users#connection"

  get "about", to: "about#index"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "logout", to: "sessions#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  resources :user_accounts

  get "new_user_account", to: "user_accounts#new"

  resources :job_navigations do
    resources :likes
  end

  resources :notifications

  resources :notifies

  get "/user/:id/profile", to: "users#profile", as: "profile"

  get "applied", to: "job_navigations#applied"
  get "feed", to: "job_navigations#feed"
  get "recommended", to: "users#recommended"

  root to: "main#index"

  get "dashboard", to: "user_accounts#dashboard"

  get "network", to: "users#network"

  get "/user/:id/follower", to: "users#follower", as: "follower"

   get "/user/:id/following", to: "users#following", as: "following"

  get "posts", to: "job_navigations#posts"

  get "/auth/:provider/callback", to: "sessions#linkedin"
  get "/auth/linkedin/callback", to: "sessions#linkedin_callback"
end
