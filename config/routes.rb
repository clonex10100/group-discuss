Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'topics#index'
  #The creation of topics is nested under groups, but topic show pages are top level with comments nested under them to avoid overly long urls
  resources :groups, only: [:index, :show] do
    resources :topics, only: [:new, :create]
  end

  resources :topics, only: [:show] do
      resources :comments, only: [:create]
  end
end
