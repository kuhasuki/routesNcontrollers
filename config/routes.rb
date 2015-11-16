Rails.application.routes.draw do
  # resources :users
  get "users", to: "users#index"
  post "users", to: "users#create"
  get "users/new", to: "users#new"
  get "users/:id/edit", to: "users#edit"
  get "users/:id", to: "users#show"
  patch "users/:id", to: "users#update"
  put "users/:id", to: "users#update"
  delete "users/:id", to: "users#destroy"
end
