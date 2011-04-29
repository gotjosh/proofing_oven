ProofingOven::Application.routes.draw do
  match 'ui(/:action)', controller: 'ui'
  root to: 'ui#index'
end
