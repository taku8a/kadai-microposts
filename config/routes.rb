Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "toppages#index"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users, only: [:index,:show, :create, :new] do
    
    member do
      get :followings
      get :followers
      get :likes
      
    end
  end
  
  resources :microposts, only: [:create, :destroy] do
    resources :bookmarks, only: [:create, :destroy]
  end
  
  
  
  resources :relationships, only: [:create, :destroy]
  
  
end
