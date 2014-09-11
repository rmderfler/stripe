Rails.application.routes.draw do

  root to: 'users#new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'sessions/new'

  resources :users do
    resources :donations, :only =>[:new, :create]
  end

  resources :sessions do
    resources :users, :except =>[:index]
  end


end
