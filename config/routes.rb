Rails.application.routes.draw do
  get 'memos/new'
  get 'sessions/new'

  root 'pages#index'
  get "pages/help"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # get    "memos",    to: "memos#index"

  get "memos/:id",   to: "memos#show"

  resources :users
  resources :memos

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
end
