Rails.application.routes.draw do
  resources :markers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root :to =>'homes#top'

get 'homes' => 'homes#about'
end
