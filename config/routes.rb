Rails.application.routes.draw do
  resources :games
  namespace :api do
    post 'challenger_token' => 'challenger_token#create'
    resources :games do
      resources :ro, only: :create
      resources :sham, only: :create
      resources :bo, only: :create
      post :shoot, to: 'shoot#create'
    end
  end

  devise_for :challengers
  authenticated :challenger do
    root 'home#index', as: :authenticated_challenger_root
  end

  root to: "landing#index"
end
