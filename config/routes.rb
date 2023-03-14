Rails.application.routes.draw do

  root 'homes#index'
  get 'recipes/tweet', to: 'homes#tweet_index'
  get 'recipes/tag/:name', to: "recipes#tag_search"
  get 'recipes/search', to: 'recipes#search'

  get 'users/:id/reregistration', to: 'users#reregistration', as: 'reregistration'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  # devise_for下記記述を削除すると$ rails routes が有効になる
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users

  resources :users do
    member do
      get :following, :followers, :favorites, :interests, :inventories, :unsubscribe
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :recipes
  resources :recipes do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :inventories, only: [:show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
