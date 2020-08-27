Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :projects do
    collection do
      get :personal
    end
    member do
      post :accept
      post :bookmark
    end
    resources :fundings, only: [ :create , :index]
  end
  resources :bookmarks, only: [ :destroy ]
  get '/fundings', to: 'fundings#index'
end
