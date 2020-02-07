Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'topics#index'
  resources :groups, only: [:index, :show] do
    resources :topics, only: [:new, :create, :show] do
      resources :comments, only: [:create]
    end
  end
  get '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create' 
  post '/signout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  resources :users, only: [:create, :show]
end
