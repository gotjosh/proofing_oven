ProofingOven::Application.routes.draw do
  
  resources :candidates, :only => [:index, :show]
  
  match 'ui(/:action)', controller: 'ui'
  root to: 'candidates#index'
end
