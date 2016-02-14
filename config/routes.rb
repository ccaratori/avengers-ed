Rails.application.routes.draw do

  namespace :teacher do
    resources :homeworks do
      resources :assignments, only: [:create, :show]
    end
  end

  namespace :student do
    resources :assignments, only: [:index] do
      resources :answers, only: [:new, :create]
    end
  end

  root 'teacher/homeworks#index'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  match 'logout', to: 'sessions#destroy', as: 'logout', via: [:get, :delete]
end
