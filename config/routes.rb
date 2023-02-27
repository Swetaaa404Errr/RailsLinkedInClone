Rails.application.routes.draw do
  resources :user_account_attachments
  resources :rooms do
    resources :chats
  end

  get "search", to: "search#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :conversations do
    resources :messages
  end

  get "jobadd", to: "job_positions#job"

  get "joblist", to: "job_positions#list"

  get "userlist", to: "users#list"

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

  get "/job_navigations/:job_navigation_id/reviews/:id", to: "reviews#destroy", as: "review_delete"

  resources :job_navigations, only: %i[show edit] do
    resources :applies
  end

  get "/job_navigations/:job_navigation_id/applies/:id/edit", to: "job_navigations#edit"

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

  get "notification", to: "users#notification"

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

  get "job_part", to: "job_navigations#job"

  post "job_show", to: "comment_posts#create"

  get "job_apply", to: "apply_jobs#new"
  post "job_apply", to: "apply_jobs#create"

  get "add_user", to: "add_networks#index"

  post "follow_account", to: "add_networks#connection"

  get "all_job", to: "job_navigations#all"

  resources :user_profiles

  resources :user_accounts

  get "new_user_account", to: "user_accounts#new"

  resources :job_navigations do
    resources :likes
  end
  get "link", to: "omniauth_callbacks#linkedin"

  get "/auth/:provider/callback", to: "oauth#callback", as: "oauth_callback"
  get "/auth/failure", to: "oauth#failure", as: "oauth_failure"

  get "/user/:id/profile", to: "users#profile", as: "profile"

  get "applied", to: "job_navigations#applied"

  root to: "main#index"

  get "dashboard", to: "user_accounts#dashboard"
end
