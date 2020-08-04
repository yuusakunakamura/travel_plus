Rails.application.routes.draw do
  
  root :to =>'homes#top'
  
  devise_for :users
  resource :users
  resources :markers
  resources :plans do
  resources :likes, only: [:create, :destroy]
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


get 'homes' => 'homes#about'
get "users/withdrawal" => "users#withdrawal"
put "users/hide" => "users#hide", as: 'users_hide'
end
