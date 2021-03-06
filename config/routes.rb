Rails.application.routes.draw do

  root 'tasks#index', as: 'tasks_index'

  namespace :admin do
    root 'base#index'
    resources :users
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

  resources :users, only: [:show, :new, :edit, :create, :update, :destroy]
  resources :tasks

  controller :dashboard do
    get 'dashboard' => :show
    get 'dashboard/edit' => :edit
    patch 'dashboard' => :update
  end

end
