ProofingOven::Application.routes.draw do
  resources :candidates, except: [:show] do
    member do
      post :accept
    end
  end

  match 'ui(/:action)', controller: 'ui', as: :wireframe
  root to: 'candidates#index'
end
