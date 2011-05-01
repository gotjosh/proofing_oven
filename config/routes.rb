ProofingOven::Application.routes.draw do
  devise_for :users

  resources :candidates, only: [:index,:new,:create] do
    collection do
      post :search
    end
  end

  match 'ui(/:action)', controller: 'ui'

  root to: 'pages#index'
end
