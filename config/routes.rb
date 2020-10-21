Rails.application.routes.draw do
  get 'users/profile'
  #get 'users/show'
  #get 'users/:id/edit' => 'users#edit', as: 'edit_user'
  #patch 'users/:id' => 'users#update', as: 'update_user'
  get 'home/index'
  post 'animals' => 'animals#create'
  get 'animals' => 'animals#index'
  patch 'animals/:id' => 'animals#update', as: 'update_animal'
  root to: 'animals#index'
  get '/users/:id/following' => 'users#follow', as:'follow'
  get '/users/:id/followers' => 'users#follower', as:'follower'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animals, only: [:new, :create, :index, :show]

  resources :relationships, only: [:create, :destroy]
  post "posts/creat" => "posts#creat"
end