Rails.application.routes.draw do

  namespace :admin do
    get 'base/index'
  end

  root 'tasks#index', as: 'tasks_index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

  resources :users, :tasks

  controller :dashboard do
    get 'dashboard' => :show
    get 'dashboard/edit' => :edit
    patch 'dashboard' => :update
  end

  controller :admin do
    get 'admin', to: 'base#index', as: 'admin'
    root 'base#index'
  end


end
