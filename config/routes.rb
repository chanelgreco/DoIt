Rails.application.routes.draw do

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

  root 'tasks#index', as: 'tasks_index'
end
