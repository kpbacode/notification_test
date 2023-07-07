Rails.application.routes.draw do
  resources :notifications, only: [:index, :show, :create]
  resources :clients, only: [:index, :show, :create]
  resources :notification_clients, only: [:create, :update]
end
