Rails.application.routes.draw do
  resources :clients, only: [:index, :show]
  resources :memberships, only: [:create]
  resources :gyms, only: [:show, :destroy]
end
