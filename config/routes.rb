Rails.application.routes.draw do
  devise_for :users
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"
  resources :categories, only: :show
  resources :users, only: [:index, :show, :edit, :update]
  resources :followships, only: [:create, :destroy]

  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    collection do
      get :feeds
    end

    member do
      get :dashboard
    end

    member do
      post :favorite
      post :unfavorite
    end

    member do
      post :like
      post :dislike
    end

  end



  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end

end
