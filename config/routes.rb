Rails.application.routes.draw do

  get 'sessions/new'
# タスク関連
  get '/' => "task#index"
  get "task/new" => "task#new"
  get "task/show/:id" => "task#show"
  get "task/edit/:id" => "task#edit"
  post "task/update/:id" => "task#update"
  post "task/create" => "task#create"
  post "task/destroy/:id" => "task#destroy"

# ユーザー関連
  get "user/show/:id" => "user#show"
  get "user/edit/:id" => "user#edit"
  get "user/new" => "user#new"
  post "user/new" => "user#create"
  post "user/create" => "user#create"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"


end
