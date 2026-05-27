Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :items do
    collection do
      get :following
    end

  resources :orders, only: [:index, :create]
end

  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
end
