ProofingOven::Application.routes.draw do
  match 'ui(/:action)', controller: 'ui'
end
