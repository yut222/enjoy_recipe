Rails.application.routes.draw do



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


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
