Rails.application.routes.draw do
  resources :plans
  root :to =>'homes#top'
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :markers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


get 'homes' => 'homes#about'
end
