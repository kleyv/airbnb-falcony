Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :projects, only: [ :new, :create, :index, :show, :edit, :update ]  do
    collection do
      get :personal
    end
    member do
      post :accept
    end
    resources :fundings, only: [ :create , :index]
  end
end
