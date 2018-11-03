Rails.application.routes.draw do

  get '/' => "task#index"
  get "task/new" => "task#new"
  get "task/show/:id" => "task#show"
  get "task/edit/:id" => "task#edit"
  post "task/update/:id" => "task#update"
  post "task/create" => "task#create"
  post "task/destroy/:id" => "task#destroy"



end
