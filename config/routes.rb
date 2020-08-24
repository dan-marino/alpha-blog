Rails.application.routes.draw do
  root 'pages#home'

  get 'about', to: 'pages#about'

  resources :articles
  # get 'articles', to: 'articles#index', as: 'articles'
  # get 'articles/new', to: 'articles#new', as: 'new_article'
  # get 'articles/:id', to: 'articles#show', as: 'article'
  # post 'articles', to: 'articles#create'
  # get 'articles/:id/edit', to: 'edit_article'
  # patch 'articles/:id', to: 'articles#update'
  # put 'articles/:id', to: 'articles#update'
  # delete 'articles/:id', to: 'articles#destroy'
end
