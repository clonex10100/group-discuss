Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'topics#index'
  #The creation of topics is nested under groups, but topic show pages are top level with comments nested under them to avoid overly long urls
  resources :groups, only: [:index, :show, :new, :create] do
    resources :topics, only: [:new, :create, :show] do
      resources :comments, only: [:create]
      resources :votes, only: [:create, :update]
    end
  end

  resources :users, only: [:show]
  resources :votes, only: [:index]
end
