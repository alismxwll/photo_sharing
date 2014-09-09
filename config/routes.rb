Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :posts do
    resources :comments
    resources :tags
  end
  resources :sessions
  resources :users
  root to: 'posts#index'
end
