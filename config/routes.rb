Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'

  resources :articles, only: [:show, :index, :create, :new]
  # get 'articles', to: 'articles#index', as: 'articles'
  # get 'articles/new', to: 'articles#new', as: 'new_article'
  # get 'articles/:id', to: 'articles#show', as: 'article'
  # post 'articles', to: 'articles#create'
end
