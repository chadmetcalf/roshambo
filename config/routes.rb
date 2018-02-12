Rails.application.routes.draw do
  resources :games
  namespace :api do
    post 'challenger_token' => 'challenger_token#create'
    resources :games do
      member do
        post '/:game_state', to: 'game_state#create'
      end
    end
    namespace :v2 do
      resources :games
    end
  end

  devise_for :challengers
  authenticated :challenger do
    root 'home#index', as: :authenticated_challenger_root
  end

  root to: "landing#index"
end
