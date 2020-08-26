Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :projects, only: [ :new, :create, :index, :show ]  do
    resources :fundings, only: [ :create , :index]
  end
end
