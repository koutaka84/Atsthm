Rails.application.routes.draw do
  get 'users/profile'
  #get 'users/show'
  #get 'users/:id/edit' => 'users#edit', as: 'edit_user'
  #patch 'users/:id' => 'users#update', as: 'update_user'
  get 'home/index'
  post 'animals' => 'animals#create'
  get 'animals' => 'animals#index'
  patch 'animals/:id' => 'animals#update', as: 'update_animal'
  root to: 'home#index'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :animals, only: [:new, :create, :index, :show]

end
