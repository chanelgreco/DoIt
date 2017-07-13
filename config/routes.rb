Rails.application.routes.draw do

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users, :tasks, :dashboard
  root 'tasks#index', as: 'tasks_index'
end
