Rails.application.routes.draw do

  get '/' => "task#index"
  get "task/new" => "task#new"
  get "task/show" => "task#show"
  post "task/create" => "task#create"
  post "task/destroy" => "task#destroy"



end
