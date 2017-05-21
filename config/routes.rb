Rails.application.routes.draw do
  root 'tasks#index', as: 'tasks_index'
  resources :tasks
end
