# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {

    :sessions => 'users/sessions',
    :registrations => 'users/registrations',
    :passwords => 'users/passwords'
  }
  
  root to: 'homes#top'
  resources :users do
    get :search, on: :collection
  end
  resources :plans do
    resources :comments, only: %i[create destroy]
    resource :likes, only: %i[create destroy]
    get :search, on: :collection
  end
  get 'homes' => 'homes#about'
  put '/users/:id/hide' => 'users#hide', as: 'users_hide'
end
