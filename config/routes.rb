ProofingOven::Application.routes.draw do
  resources :candidates, only: [:index, :new, :create]

  match 'ui(/:action)', controller: 'ui'
  root to: 'ui#index'
end
