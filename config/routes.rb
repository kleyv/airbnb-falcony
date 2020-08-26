Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :projects, only: [ :new, :create, :index, :show ]  do
    collection do
      get :personal
    end
    resources :fundings, only: [ :create , :index]
  end
end
