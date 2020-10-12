Rails.application.routes.draw do
  get 'tasklist/create'
  get 'tasklist/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'tasks/index'
  get 'users/index'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'tasks', to: 'tasks#index'
  get 'signup', to: 'users#new'
  
  resources :tasks
  resources :users, only: [:index, :show, :new, :create]
  
  resources :tasklists, only: [:create, :destroy]
end
