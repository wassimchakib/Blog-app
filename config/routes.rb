Rails.application.routes.draw do
  root "users#index"

  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:new, :create, :index, :show, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  ## API
  namespace :api do
    resources :users, only: [:index, :create, :update, :destroy, :show] do
      resources :posts, only: [:index, :create, :update, :destroy, :show] do
        resources :comments, only: [:index, :show]
        resources :likes, only: [:index, :show]
      end
    end
  end
end
