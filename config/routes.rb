Rails.application.routes.draw do
  resources :users, only: [:index, :create, :destroy, :update, :show]
  resources :contacts, only: [:index, :create, :destroy, :update, :show]
  resources :contact_shares, only: [:create, :destroy]
end
