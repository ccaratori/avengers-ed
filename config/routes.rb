Rails.application.routes.draw do

  namespace :teacher do
    resources :homeworks do
      resources :assignments, only: [:create]
    end
  end

  namespace :student do
    resources :assignments, only: [:index] 
  end

  root 'teacher/homeworks#index'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  match 'logout', to: 'sessions#destroy', as: 'logout', via: [:get, :delete]
end
