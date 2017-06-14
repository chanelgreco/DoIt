Rails.application.routes.draw do
  resources :users
  root 'tasks#index', as: 'tasks_index'
  resources :tasks
end
