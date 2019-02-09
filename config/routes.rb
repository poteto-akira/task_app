Rails.application.routes.draw do

  root to: "task#index"

  get 'sessions/new'

# タスク関連
  resources :task
  # get "task/new" => "task#new"
  # get "task/show/:id" => "task#show"
  # get "task/edit/:id" => "task#edit"
  # post "task/update/:id" => "task#update"
  # post "task/create" => "task#create"
  # post "task/destroy/:id" => "task#destroy"
  # get "task/next/:id" => "task#next"
  # post "task/next/:id" => "task#next"
  # get "task/back/:id" => "task#back"
  # post "task/back/:id" => "task#back"
  # get "task/search" => "task#search"

# ユーザー関連
  get "user/show/:id" => "user#show"
  get "user/edit/:id" => "user#edit"
  patch "user/update/:id" => "user#update"
  delete "user/delete/:id" => "user#destroy"
  get "user/new" => "user#new"
  post "user/new" => "user#create"
  post "user/create" => "user#create"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"



end
