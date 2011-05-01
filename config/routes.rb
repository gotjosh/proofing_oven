ProofingOven::Application.routes.draw do
  resources :candidates, except: [:show]

  match 'ui(/:action)', controller: 'ui', as: :wireframe
  root to: 'candidates#index'
end
