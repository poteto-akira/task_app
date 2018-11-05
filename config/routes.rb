Rails.application.routes.draw do

# タスク関連
  get '/' => "task#index"
  get "task/new" => "task#new"
  get "task/show/:id" => "task#show"
  get "task/edit/:id" => "task#edit"
  post "task/update/:id" => "task#update"
  post "task/create" => "task#create"
  post "task/destroy/:id" => "task#destroy"

# ユーザー関連
  get "user/show" => "user#show"
  get "user/edit/:id" => "user#edit"
  get "user/new" => "user#new"
  post "user/create" => "user#create"

end
