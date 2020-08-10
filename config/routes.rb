Rails.application.routes.draw do
  devise_for :users
  root :to =>'homes#top'
  
  
  resources :users
  resources :markers
  resources :plans do
  resources :comments, only: [:create,:destroy]
  resource :likes, only: [:create, :destroy]
end
  resources :plan_dates
  

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


get 'homes' => 'homes#about'
get "users/withdrawal" => "users#withdrawal"
put "users/hide" => "users#hide", as: 'users_hide'
get '/search', to: 'search#search'
end
