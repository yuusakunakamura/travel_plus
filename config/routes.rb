Rails.application.routes.draw do
  resources :plans
  root :to =>'homes#top'
  get 'users/index'
  get 'users/show'
  get "users/withdrawal" => "users#withdrawal"
  put "users/hide" => "users#hide", as: 'users_hide'
  devise_for :users
  resources :markers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


get 'homes' => 'homes#about'
end
