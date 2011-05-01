ProofingOven::Application.routes.draw do
  
  resources :candidates, :except => :destroy
  
  match 'ui(/:action)', controller: 'ui'
  root to: 'candidates#index'
end
