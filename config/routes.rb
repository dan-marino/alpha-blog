Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'

  # resources :articles, only: [:show, :index]
  get 'articles/:id', to: 'articles#show'
  get 'articles', to: 'articles#index'
end
