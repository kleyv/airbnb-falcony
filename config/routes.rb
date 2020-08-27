Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :projects do
    collection do
      get :personal
    end
    member do
      post :accept
    end
    resources :fundings, only: [ :create , :index]
  end
  get '/fundings', to: 'fundings#index'
end
