Rails.application.routes.draw do
  get 'tasks/index'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  

  get 'tasks', to: 'users#index'
  get 'signup', to: 'users#new'
  
  resources :tasks
  resources :users, only: [:index, :show, :new, :create]
end
