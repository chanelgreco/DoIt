Rails.application.routes.draw do

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  root 'tasks#index', as: 'tasks_index'
  resources :tasks
end
