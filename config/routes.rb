Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips do 
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :welcome, only: [:show]
  resources :contacts, only: [:show]
  resources :cities, only: [:show]
  resources :users, only: [:show, :create, :new]
  resources :sessions, only: [:new, :create, :destroy]
  resources :team, only: [:show]
  root 'gossips#index'
end

