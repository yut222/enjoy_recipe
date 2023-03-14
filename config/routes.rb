Rails.application.routes.draw do



  get 'inventories/edit'
  get 'inventories/new'
  get 'inventories/show'
  root 'homes#index'
  get 'recipes/tweet', to: 'homes#tweet_index'
  get 'recipes/tag/:name', to: "recipes#tag_search"
  get 'recipes/search', to: 'recipes#search'

  resources :relationships, only: [:create, :destroy]

  resources :recipes
  resources :recipes do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :inventories, only: [:show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
