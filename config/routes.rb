Rails.application.routes.draw do
  root "top#index"
  get "top/profile"
  resources :users
  post "/users/new" => "users#create"
end
