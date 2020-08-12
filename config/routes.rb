Rails.application.routes.draw do
   devise_for :users, controllers: {
    
    :sessions => 'users/sessions'
  }

  root :to =>'homes#top'
  resources :users
  resources :plans do
  resources :comments, only: [:create,:destroy]
  resource :likes, only: [:create, :destroy]
end
  
get 'homes' => 'homes#about'
put '/users/:id/hide' => 'users#hide', as: 'users_hide'
get '/search', to: 'search#search'
end
