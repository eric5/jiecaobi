Rails.application.routes.draw do
  root to: 'home#index'

  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  get 'sign_out', to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:create]
  resources :reputations
end
