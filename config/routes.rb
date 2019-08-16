Rails.application.routes.draw do
  get 'memos/new'
  get 'sessions/new'

  root 'pages#index'
  get "pages/help"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :memos
end
